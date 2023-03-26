function[A] = Create_Poisson_problem_A(N)

%create the matrix using a compressed row and then hydrate it 
%to create the Matrix, then display it . 
[nzA,ir,ic]=create_poisson_matrix(N);
A= Hydrate(nzA,ir,ic);

disp(A);
end












