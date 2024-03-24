<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Order;
use App\Entity\Pizza;
use App\Form\categories\DeleteCategoryType;
use App\Form\categories\InsertCategory;
use App\Form\CategoryType;
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

    #[Route('admin/insert/category', name: 'admin_insert_category')]
    public function insert(Request $request, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(InsertCategory::class);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $category = $form->getData();
            $em->persist($category);
            $em->flush();
            $this->addFlash('success', 'Nieuwe categorie is toegevoegd!');
            return $this->redirectToRoute('admin');
        }

        return $this->render('admin/insert.html.twig', [
            'form' => $form
        ]);
    }

    #[Route('admin/delete/pizza/{id}', name: 'admin_delete_pizza')]
    public function deletePizza(EntityManagerInterface $em, int $id): Response
    {
        $category = $em->getRepository(Category::class)->find($id);
        $pizza = $em->getRepository(Pizza::class)->find($id);
        $em->remove($pizza);
        $em->flush();
        $this->addFlash('success', 'Deze categorie is verwijderd!');

        return $this->render('admin/categories/pizzas.html.twig', [
            'category' => $category,
            'pizza' => $pizza
        ]);
    }
}
