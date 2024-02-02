<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GuestController extends AbstractController
{
    #[Route('/')]
    public function home(): Response
    {
        return $this->render('project/home.html.twig');
    }

    #[Route('/fish')]
    public function fish()
    {
        return new Response("Fish pizzas");
    }

    #[Route('/meat')]
    public function meat()
    {
        return new Response("Meat pizzas");
    }

    #[Route('/vegetarian')]
    public function vegetarian()
    {
        return new Response("Vegetarian pizzas");
    }

    #[Route('/contact')]
    public function contact()
    {
        return new Response("Contact");
    }

    #[Route('/login')]
    public function login()
    {
        return new Response("Log In");
    }

    #[Route('/signup')]
    public function signup()
    {
        return new Response("Sign Up");
    }
}