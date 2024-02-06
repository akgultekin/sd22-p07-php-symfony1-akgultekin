<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GuestController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function home(): Response
    {
        return $this->render('base.html.twig');
    }

    #[Route('/fish', name: 'fish')]
    public function fish()
    {
        return new Response("Fish pizzas");
    }

    #[Route('/meat', name: 'meat')]
    public function meat()
    {
        return new Response("Meat pizzas");
    }

    #[Route('/vegetarian', name: 'vegetarian')]
    public function vegetarian()
    {
        return new Response("Vegetarian pizzas");
    }

    #[Route('/contact', name: 'contact')]
    public function contact()
    {
        return new Response("Contact");
    }

    #[Route('/login', name: 'login')]
    public function login()
    {
        return new Response("Log In");
    }

    #[Route('/signup', name: 'signup')]
    public function signup()
    {
        return new Response("Sign Up");
    }
}