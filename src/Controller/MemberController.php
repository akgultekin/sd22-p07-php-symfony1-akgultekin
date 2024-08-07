<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MemberController extends AbstractController
{
    #[Route('/member', name: 'member')]
    public function index(): Response
    {
        return $this->render('member/home.html.twig', [
            'controller_name' => 'MemberController'
        ]);
    }
}
