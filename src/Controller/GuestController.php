<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Pizza;
use App\Entity\Pizzas;
use App\Form\CategoryType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GuestController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function home(EntityManagerInterface $em): Response
    {
        $categories = $em->getRepository(Category::class)->findAll();
        return $this->render('guest/home.html.twig', [
            'categories' => $categories
        ]);
    }

    #[Route('/pizzas/{id}', name: 'pizzas')]
    public function pizzas(EntityManagerInterface $em, int $id)
    {
        $category = $em->getRepository(Category::class)->find($id);
        return $this->render('guest/categories/pizzas.html.twig', [
            'category' => $category
        ]);
    }

    #[Route('pizzas/details/{id}', name: 'details')]
    public function details(EntityManagerInterface $em, int $id = null)
    {
        $pizza = $em->getRepository(Pizza::class)->find($id);
        return $this->render('guest/categories/details.html.twig', [
            'pizza' => $pizza
        ]);
    }

    #[Route('/contact', name: 'contact')]
    public function contact()
    {
        return $this->render('guest/contact.html.twig');
    }

    #[Route('/login', name: 'login')]
    public function login()
    {
        return $this->render('guest/login.html.twig');
    }

    #[Route('/signup', name: 'signup')]
    public function signup()
    {
        return $this->render('guest/signup.html.twig');
    }

    #[Route('/order', name: 'order')]
    public function order()
    {
        return $this->render('guest/order.html.twig');
    }
}