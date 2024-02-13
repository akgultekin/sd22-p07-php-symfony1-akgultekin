<?php

namespace App\Controller;

use App\Entity\Pizzas;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GuestController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function home(): Response
    {
        return $this->render('guest/home.html.twig', [
            'controller_name' => 'GuestController'
        ]);
    }

    #[Route('/fish/{id}', name: 'fish')]
    public function fish(int $id = null)
    {
        return $this->render("guest/categories/fish.html.twig");
    }

    #[Route('/meat', name: 'meat')]
    public function meat()
    {
        return $this->render("guest/categories/meat.html.twig");
    }

    #[Route('/vegetarian', name: 'vegetarian')]
    public function vegetarian()
    {
        return $this->render("guest/categories/vegetarian.html.twig");
    }

    #[Route('/contact', name: 'contact')]
    public function contact()
    {
        return $this->render("guest/contact.html.twig");
    }

    #[Route('/login', name: 'login')]
    public function login()
    {
        return $this->render("guest/login.html.twig");
    }

    #[Route('/signup', name: 'signup')]
    public function signup()
    {
        return $this->render("guest/signup.html.twig");
    }

    #[Route('/order', name: 'order')]
    public function order()
    {
        return $this->render("guest/order.html.twig");
    }
}