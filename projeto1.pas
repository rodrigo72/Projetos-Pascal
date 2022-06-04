program loja_de_vinil;
uses 
    crt;
    
    
var
    op1: char;
    op2: boolean;
    op1A: integer;
    op2A: integer;
    op3A: integer;
    opM1: string;
    opM2: string;
    
    price: real;
    qtd: integer;
    media1: real;
    desconto: real;
    
    UserInput: string;
    UserInput2: string;
    UserInput3: string;
    error: integer;
    error2: integer;
    error3: integer;
    n1: integer;
    n2: string;
    n3: integer;

    
    r1, r2, r3: string;
    pr1, pr2, pr3: string;
    p1, p2, p3: string;
    r1q, r2q, r3q: integer;
    pr1q, pr2q, pr3q: integer;
    p1q, p2q, p3q:integer;
    nome: string; 
    morada: string;


procedure menu1;
begin
    writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
    writeln ('-                                VINYL STORE                                -');
    writeln ('-                        :Bem-vindo a loja de vinis:                        -');
    writeln ('-                                                                           -');
    writeln ('-                                                                           -');
    writeln ('-                               Pagina inicial                              -');
    writeln ('-                         Generos Musicais e Estilos                        -');
    writeln ('-                                                                           -');
    writeln ('-                            1. Rock                                        -');
    writeln ('-                            2. Post-punk Revival                           -');
    writeln ('-                            3. Pop                                         -');
    writeln ('-                                                                           -');
    writeln ('-                            4. Carrinho                                    -');
    writeln ('-                                                                           -');
    writeln ('-         Escolha um dos generos utilizando o numero correspondente.        -');
    writeln ('-    Sera aplicado um desconto de 10 por cento, se exceder os 100 euros.    -');
    writeln ('-                                                                           -');
    writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
end; 

procedure menu2;
begin
    writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
    writeln ('-                             Albuns disponiveis                            -');
    writeln ('-                                                                           -');
    writeln ('-        1. In the Court of the Crimson King, King Crimson: 20,99$          -');
    writeln ('-        2. Nevermind (Limited Edition), Nirvana: 59,99$                    -');
    writeln ('-        3. Conjunto com os dois albuns disponiveis: 76.99$                 -');
    writeln ('-                                                                           -');
    writeln ('-    Escolha um dos albuns acima utilizando o numero correspondente para    -');
    writeln ('-                           adicionar ao carrinho.                          -');
    writeln ('-                                                                           -');
    writeln ('-                                                                           -');
    writeln ('-                                 4. Voltar                                 -');
    writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
end;

procedure menu3;
begin
    writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
    writeln ('-                             Albuns disponiveis                            -');
    writeln ('-                                                                           -');
    writeln ('-        1. Is This It (Delux Edition), The Strokes: 49,99$                 -');
    writeln ('-        2. Favorite Worst Nightmare, Arctic Monkeys: 19,99$                -');
    writeln ('-        3. Conjunto com os dois albuns disponiveis: 61.99$                 -');
    writeln ('-                                                                           -');
    writeln ('-    Escolha um dos álbuns acima utilizando o numero correspondente para    -');
    writeln ('-                           adicionar ao carrinho.                          -');
    writeln ('-                                                                           -');
    writeln ('-                                                                           -');
    writeln ('-                                 4. Voltar                                 -');
    writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
end;

procedure menu4;
begin
    writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
    writeln ('-                             Albuns disponíveis                            -');
    writeln ('-                                                                           -');
    writeln ('-        1. Rubber Soul, The Beatles: 39,99$                                -');
    writeln ('-        2. Self Titled, Twenty One Pilots: 29,99$                          -');
    writeln ('-        3. Conjunto com os dois albuns disponíveis: 59.99$                 -');
    writeln ('-                                                                           -');
    writeln ('-    Escolha um dos albuns acima utilizando o numero correspondente para    -');
    writeln ('-                           adicionar ao carrinho.                          -');
    writeln ('-                                                                           -');
    writeln ('-                                                                           -');
    writeln ('-                                 4. Voltar                                 -');
    writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
end;


begin
    price := 0;
    qtd := 0;
    r1q := 0;
    r2q := 0;
    r3q := 0; 
    pr1q := 0;
    pr2q := 0;
    pr3q := 0;
    p1q := 0;
    p2q := 0;
    p3q := 0;
    
    clrscr;
    repeat
        repeat 
            menu1;
            writeln;
            gotoxy (38,19);
            readln (op1);
            clrscr;
        until (op1 = '1') or (op1 = '2') or (op1 = '3') or (op1 = '4');
            
        case op1 of
            '1':begin
                    repeat
                        clrscr;
                        menu2;
                        repeat
                            writeln ('Escreva as suas opcoes: ');
                            readln (UserInput);
                            val (UserInput, op1A, error);
                            if error <> 0 then
                                begin
                                    clrscr;
                                    menu2;
                                    writeln ('-- Invalido. Tente novamente --');
                                end;
                                    
                        until error = 0;
                            
                        if op1A = 1 then
                            begin
                                price := (price+20.99);
                                qtd := (qtd+1);
                                r1q := (r1q+1);
                                r1 := 'In the Court of the Crimson King, King Crimson: 20,99$';
                                writeln ('-- Artigo Selecionado --');
                                delay (500);
                                clrscr;
                                menu2;
                            end
                        else if op1A = 2 then
                            begin
                                price := (price+59.99);
                                qtd := (qtd+1);
                                r2q := (r2q+1);
                                r2 := 'Nevermind (Limited Edition), Nirvana: 59,99$';
                                writeln ('-- Artigo Selecionado --');
                                delay (500);
                                clrscr;
                                menu2;
                            end
                        else if op1A = 3 then
                            begin
                                price := (price+76.99);
                                qtd := (qtd+1);
                                r3q := (r3q+1);
                                r3 := 'Conjunto - In the Court of the Crimson King + Nevermind (L.E.): 76.99$';
                                writeln ('-- Artigo Selecionado --');
                                delay (500);
                                clrscr;
                                menu2;
                            end
                        else if op1A = 4 then
                            begin
                                clrscr;
                            end;
                    until op1A = 4;
                end;
            
            '2':begin 
                    repeat
                        clrscr;
                        menu3;
                        repeat
                            writeln ('Escreva as suas opcoes: ');
                            readln (UserInput2);
                            val (UserInput2, op2A, error2);
                            if error2 <> 0 then
                                begin
                                    clrscr;
                                    menu3;
                                    writeln ('-- Invalido. Tente novamente --');
                                end;
                                    
                        until error2 = 0;
                        
                
                        if op2A = 1 then
                            begin
                                price := (price+49.99);
                                qtd := (qtd+1);
                                pr1q := (pr1q+1);
                                pr1 := 'Is This It (Delux Edition), The Strokes: 49,99$';
                                writeln ('-- Artigo Selecionado --');
                                delay (500);
                                clrscr;
                                menu3;
                            end
                        else if op2A = 2 then
                            begin
                                price := (price+19.99);
                                qtd := (qtd+1);
                                pr2q := (pr2q+1);
                                pr2 := 'Favorite Worst Nightmare, Arctic Monkeys: 19,99$';
                                writeln ('-- Artigo Selecionado --');
                                delay (500);
                                clrscr;
                                menu3;
                            end
                        else if op2A = 3 then
                            begin
                                price := (price+61.99);
                                qtd := (qtd+1);
                                pr3q := (pr3q+1);
                                pr3 := 'Conjunto - Is This It (Delux Edition) + Favorite Worst Nightmare: 61.99$';
                                writeln ('-- Artigo Selecionado --');
                                delay (500);
                                clrscr;
                                menu3;
                            end
                        else if op2A = 4 then
                            begin
                                clrscr;
                            end;
                    until op2A = 4;
                end;
        
            '3':begin
                    repeat
                        clrscr;
                        menu4;
                        repeat
                            writeln ('Escreva as suas opcoes: ');
                            readln (UserInput3);
                            val (UserInput3, op3A, error3);
                            if error3 <> 0 then
                                begin
                                    clrscr;
                                    menu4;
                                    writeln ('-- Invalido. Tente novamente --');
                                end;
                                    
                        until error3 = 0;
                
                        if op3A = 1 then
                            begin
                                price := (price+39.99);
                                qtd := (qtd+1);
                                p1q := (p1q+1);
                                p1 := 'Rubber Soul, The Beatles: 39,99$';
                                writeln ('-- Artigo Selecionado --');
                                delay (500);
                                clrscr;
                                menu4;
                            end
                        else if op3A = 2 then
                            begin
                                price := (price+29.99);
                                qtd := (qtd+1);
                                p2q := (p2q+1);
                                p2 := 'Self Titled, Twenty One Pilots: 29,99$';
                                writeln ('-- Artigo Selecionado --');
                                delay (500);
                                clrscr;
                                menu4;
                            end
                        else if op3A = 3 then
                            begin
                                price := (price+59.99);
                                qtd := (qtd+1);
                                p3q := (p3q+1);
                                p3 := 'Conjunto: Rubber Soul + Self Titled: 59.99$';
                                writeln ('-- Artigo Selecionado --');
                                delay (500);
                                clrscr;
                                menu4;
                            end
                        else if op3A = 4 then
                            begin
                                clrscr;
                            end;
                    until op3A = 4;
                end;
            
            '4':begin
                    break;
                end;
        end;
    
        clrscr;
        writeln ('Continuar a comprar? (sim, s/ nao, n)');
        readln (opM1);
        clrscr;
    
    until (opM1 = 'nao') or (opM1 = 'n') or (opM1 = 'N');
    
   
    randomize;
    n1 := random (4);
    
    if n1 <> 1 then
        begin
            delay (600);
            writeln (' Loading');
            
            delay (600);
            clrscr;
            writeln (' Loading.');
            
            delay (600);
            clrscr;
            writeln (' Loading..');
            
            delay (600);
            clrscr;
            writeln (' Loading...');
            
            delay (600);
            clrscr;
        end;
            
    writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
    writeln ('                             CARRINHO DE COMPRAS                             ');
    writeln;
    writeln;
    writeln ('                           :Artigos selecionados:                            ');
    writeln;
    
    if r1q <> 0 then
        writeln (' - ', r1, ' * ', r1q);
    if r2q <> 0 then
        writeln (' - ', r2, ' * ', r2q);
    if r3q <> 0 then
        writeln (' - ', r3, ' * ', r3q);
        
    if (r1q <> 0) OR (r2q <> 0) OR (r3q <> 0) then
        writeln;
        
    if pr1q <> 0 then
        writeln (' - ', pr1, ' * ', pr1q);
    if pr2q <> 0 then
        writeln (' - ', pr2, ' * ', pr2q);
    if pr3q <> 0 then
        writeln (' - ', pr3, ' * ', pr3q);
        
    if (pr1q <> 0) OR (pr2q <> 0) OR (pr3q <> 0) then
        writeln;
        
    if p1q <> 0 then
        writeln (' - ', p1, ' * ', p1q);
    if p2q <> 0 then
        writeln (' - ', p2, ' * ', p2q);
    if p3q <> 0 then
        writeln (' - ', p3, ' * ', p3q);
    
    writeln;
    writeln;

    if price > 0 then
        begin
            op2 := true;
            if price <= 100 then
                begin
                    writeln ('                            Total: ', price:0:2);
                    media1 := price/qtd;
                    writeln ('                 Media dos precos: ', media1:0:2);
                end
            else if price > 100 then
                begin
                    writeln ('  A compra excedeu 100 euros e, por isso, tera um desconto de 10 por cento.');
                    desconto := price*0.9;
                    media1 := price/qtd;
                    writeln ('                         Subtotal: ', price:0:2, '$');
                    writeln ('                            Total: ', desconto:0:2, '$');
                    writeln ('                 Media dos precos: ', media1:0:2, '$');
                end;
        end
    else begin
            writeln ('                           Nao selecionou artigos.                           ');
            writeln ('                 Precione <Enter> para interromper a compra.                 ');
            writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
            readln;
         end;

    if op2 = true then
        begin
            writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
            writeln ('-                        Deseja contiuar? (sim/ nao)                        -');
            writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
            repeat 
                readln (opM2);
            until (opM2 = 'sim') or (opM2 = 'nao') or (opM2 = 's') or (opM2 = 'n');
        
            if (opM2 = 'nao') or (opM2 = 'n') then
                begin
                    clrscr;
                    writeln ('Precione <Enter> para interromper a compra.');
                    readln;
                end
            else if (opM2 = 'sim') or (opM2 = 's') then
                begin 
                    clrscr;
                    writeln ('Insira o seu nome: ');
                    readln (nome);
                    writeln;
                    writeln ('Insira a sua morada: ');
                    readln (morada);
                    writeln;
                    
                    writeln ('Insira o seu numero de telemovel: ');
                    writeln ('(Opcional, pode escrever <skip> ou <s> para passar a frente) ');
                    readln (n2);
                    n3 := length(n2);
                    if (n3 <> 9) xor (n2 = 's') xor (n2 = 'skip') then
                        begin
                            writeln ('-- Invalido. Tente novamente --');
                            while (n3 <> 9) do
                                begin
                                    readln (n2);
                                    n3 := length(n2);
                                    if (n2 = 'skip') or (n2 = 's') then
                                        break;
                                end;
                        end;
                        
                    writeln;
                    clrscr;
                    writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
                    writeln ('                                    Dados:                                   ');
                    writeln;
                    writeln ('  -  ', nome);
                    writeln ('  -  ', morada);
                    
                    if n3 = 9 then
                        writeln ('  -  ', n2);
                        
                    writeln;
                    writeln ('  -  Entrega Standard (9h00 - 19h00): 0.00$');
                    writeln ('  -  Metodo de pagamento (Unico): Multibanco');
                    if price <= 100 then
                        begin
                            randomize;
                            writeln ('  -  Total: ', price:0:2);
                            media1 := price/qtd;
                            writeln ('  -  Media dos precos: ', media1:0:2);
                            writeln ('  -  Entidade: ', random(9)+1, random(10), random(10), random(10), random(10));
                            writeln ('  -  Referencia: ', random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10));
                        end
                    else if price > 100 then
                        begin
                            randomize;
                            desconto := price*0.9;
                            media1 := price/qtd;
                            writeln ('  -  Subtotal: ', price:0:2, '$');
                            writeln ('  -  Total: ', desconto:0:2, '$');
                            writeln ('  -  Media dos precos: ', media1:0:2, '$');
                            writeln ('  -  Entidade: ', random(9)+1, random(10), random(10), random(10), random(10));
                            writeln ('  -  Referencia: ', random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10));
                        end;
                    writeln;
                    writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
                    writeln ('-                Pressione <Enter> para finalizar encomenda.                -');
                    writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
                    readln;
                end;
        end;
        
    clrscr;
    writeln;
    writeln;
    writeln ('  $     $  $  $  $  $   $  $        $$  $$$   $$   $$   $$$  ');
    writeln ('   $   $   $  $$ $   $ $   $       $     $   $  $  $ $  $$   ');
    writeln ('    $ $    $  $ $$    $    $         $   $   $  $  $$   $    ');
    writeln ('     $     $  $  $    $    $$$     $$    $    $$   $ $  $$$  ');
    writeln;
    writeln;
    writeln ('  $              $$            $        $                    ');
    writeln ('  $$$   $  $     $ $   $$    $$$   $$       $$    $$         ');
    writeln ('  $  $  $  $     $$   $  $  $  $  $  $  $  $  $  $  $        ');
    writeln ('  $$$   $$$$     $ $   $$    $$$  $     $   $$$   $$         ');
    writeln ('           $                                  $              ');
    writeln ('         $$$                                $$$              ');
    writeln;
    writeln;
    delay (500);
    writeln ('         Pressione <Enter> novamente para terminar.          ');
    readln;
    
end.











