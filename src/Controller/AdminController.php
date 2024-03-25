<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Order;
use App\Entity\Pizza;
use App\Form\categories\DeleteCategoryType;
use App\Form\categories\InsertCategory;
use App\Form\CategoryType;
use App\Form\DeletePizzaType;
use App\Form\InsertPizzaType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    #[Route('/admin', name: 'admin')]
    public function home(EntityManagerInterface $em): Response
    {
        $categories = $em->getRepository(Category::class)->findAll();
        return $this->render('admin/home.html.twig', [
            'categories' => $categories,
        ]);
    }

    #[Route('admin/pizzas/{id}', name: 'admin_pizzas')]
    public function pizzas(EntityManagerInterface $em, int $id)
    {
        $category = $em->getRepository(Category::class)->find($id);
        return $this->render('admin/categories/pizzas.html.twig', [
            'category' => $category
        ]);
    }

    #[Route('admin/pizzas/insert/{id}', name: 'admin_insert_pizza')]
    public function insertPizza(Request $request, EntityManagerInterface $em, int $id): Response
    {
        $category = $em->getRepository(Category::class)->find($id);
        $pizza = new Pizza();
        $form = $this->createForm(InsertPizzaType::class, $pizza);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $pizza = $form->getData();
            $em->persist($pizza);
            $em->flush();
            $this->addFlash('success', 'Nieuwe pizza is toegevoegd!');
            return $this->redirectToRoute('admin_pizzas', ['id' => $category->getId()]);
        }

        return $this->render('admin/insert.html.twig', [
            'form' => $form,
            'category' => $category
        ]);
    }

    #[Route('admin/pizzas/delete/{id}', name: 'admin_delete_pizza')]
    public function deletePizza(Request $request, EntityManagerInterface $em, int $id): Response
    {
        $form = $this->createForm(DeletePizzaType::class);
        $form->handleRequest($request);
        if ($form->isSubmitted()) {
            $pizza = $em->getRepository(Pizza::class)->find($id);
            $em->remove($pizza);
            $em->flush();
            $this->addFlash('success', 'Deze pizza is verwijderd!');
            return $this->redirectToRoute('admin_pizzas', ['id' => $pizza->getCategory()->getId()]);
        }

        return $this->render('admin/delete.html.twig', [
            'form' => $form
        ]);
    }
}
