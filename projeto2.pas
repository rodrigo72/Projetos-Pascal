program projetoPascal2;
uses crt, sysutils;

type
    matriz = array[1..2,1..3] of real;

var
    key, key2, key3: array[1..50] of char;
    custo, vendas, balanco: array[1..2,1..3] of real;
    password, password2, password3, user, user2, empresa, produto, op1, op2, t1: string;
    num, tamanho, i, i2, j, k, t2: integer;
    count, count2: integer;
    lastChar: integer;
    flag1: boolean;
    a, b, c, d, e: string;
    UserInput: string;
    error: integer;
    op3: string;
    media: real;


procedure maxarr(arr: matriz);  
    var
        max: real;
    begin
        max := arr[1,1];
        for i := 1 to 2 do 
            for i2 := 1 to 3 do
                begin
                    if arr[i,i2] > max then
                        max := arr[i,i2];
                end;
        writeln('O valor maximo foi ', max:0:2, '$.');
        
        for i := 1 to 2 do 
            for i2 := 1 to 3 do 
                if arr[i,i2] = max then
                    writeln('- no ', i, ' ano, e no ', i2, ' trimestre.');
    end;
    
procedure minarr(arr: matriz);
    var
        min: real;
    begin
        min := arr[1,1];
        for i := 1 to 2 do 
            for i2 := 1 to 3 do 
                begin
                    if arr[i,i2] < min then
                        min := arr[i, i2];
                end;
        writeln('O valor minimo foi ', min:0:2, '$.');
        
        for i := 1 to 2 do 
            for i2 := 1 to 3 do 
                if arr[i,i2] = min then
                    writeln('- no ', i, ' ano, e no ', i2, ' trimestre.');
    end;
    
function totalArr(arr: matriz): real;
    var 
        total: real;
    begin
        total := 0;
        for i := 1 to 2 do 
            for i2 := 1 to 3 do 
                total := total + arr[i,i2];
        totalArr := total;
    end;

procedure totalAnualArr(arr: matriz);
    var 
        anual: array[1..2] of real;
    begin
        for i := 1 to 2 do 
            begin
                for i2 := 1 to 3 do 
                    anual[i] := anual[i] + arr[i, i2];
                writeln('No ', i, ' ano, o valor total foi ', anual[i]:0:2, '$.');
            end;
    end;
    
procedure vendasPrint;
    begin
        writeln('Vendas Quadrimestrais: ');
        writeln;
        for i := 1 to 2 do 
            for i2 := 1 to 3 do 
                writeln('No ', i, ' ano, ganhou ', vendas[i,i2]:0:2, '$ com as vendas dos(as) ', produto, ' no ', i2, ' trimestre.');
        writeln;
    end;

procedure custoPrint;
    begin
        writeln('Custos Quadrimestrais: ');
        writeln;
        for i := 1 to 2 do 
            for i2 := 1 to 3 do 
                writeln('No ', i, ' ano, os custos foram de ', custo[i,i2]:0:2, '$ no ', i2, ' trimestre.');
        writeln;
    end;
    
procedure balancoPrint;
    begin
        writeln('Balanco Quadrimestral: ');
        writeln;
        for i := 1 to 2 do 
            for i2 := 1 to 3 do 
                writeln('No ', i, ' ano, o balanco foi de ', balanco[i,i2]:0:2, '$ no ', i2, ' trimestre.');
        writeln;
    end;

procedure pr1;
    begin
        ClrScr;
        writeln();
        writeln('Nome de utilizador: ', user);
    end;

procedure pr2;
    begin 
        ClrScr;
        writeln();
        writeln('Nome de utilizador: ', user);
        write('Password: ');
        for i := 1 to length(password) do 
            write('*');
        writeln();
        write('Confirme a password: ');
        for i := 1 to length(password) do 
            write('*');
        writeln;
    end;

procedure pr3;
    begin
        clrscr;
        writeln;
        writeln('Nome da sua empresa: ', empresa);
        writeln('Numero de telemovel: ', t1);
        writeln('Produto que comecializa: ', produto);
    end;
    
procedure pr4;
    begin
        clrscr;
        writeln;
        writeln('-- Login --');
        write('Username: ', user2);
        writeln;
        write('Password: ');
    end;
    
procedure pr5;
    begin
        clrscr;
        writeln;
        writeln('Nome da sua empresa: ', empresa);
        writeln('Numero de telemovel: ');
        writeln ('(Opcional, pode escrever <skip> ou <s> para passar a frente) ');
    end;
    
procedure menu;
    begin
        clrscr;
        writeln;
        writeln('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
        writeln('- ', datetostr(Date), '                                                           ', timetostr(Time),' -');
        writeln('-                            Escolha uma das opcoes:                        -');
        writeln('-                                                                           -');
        writeln('- 1.Vendas Quadrimestrais  7.Custos Quadrimestrais 13.Balanco Quadrimestral -');
        writeln('- 2.Total de Vendas anual  8.Total de Custos anual 14.Balanco anual         -');
        writeln('- 3.Total das Vendas       9.Total dos Custos      15.Balanco Total         -');
        writeln('- 4.Media das Vendas       10.Media dos Custos     16.Media do balanco      -');
        writeln('- 5.Maximo das Vendas      11.Maximo dos custos    17.Maximo do balanco     -');
        writeln('- 6.Minimo das Vendas      12.Minimo dos Custos    18.Minimo do balanco     -');
        writeln('-                          0. Sair                 19.Info                  -');
        writeln('-                                                                           -');
        writeln('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
        gotoxy(40, 13);
    end;
    
procedure inicio;
    begin
        writeln;
        writeln('  _                _                         ');
        writeln(' | |              (_)                        ');
        writeln(' | | _  _   _  ___ _ ____   ____  ___  ___   ');
        writeln(' | || \| | | |/___) |  _ \ / _  )/___)/___)  ');
        writeln(' | |_) ) |_| |___ | | | | ( (/ /|___ |___ |  ');
        writeln(' |____/ \____(___/|_|_| |_|\____|___/(___/   ');
        writeln('                                             ');
        writeln;
        writeln('  ____   ____ ____   ____  ____  ____  ____  ');
        writeln(' |    \ / _  |  _ \ / _  |/ _  |/ _  )/ ___) ');
        writeln(' | | | ( ( | | | | ( ( | ( ( | ( (/ /| |     ');
        writeln(' |_|_|_|\_||_|_| |_|\_||_|\_|| |\____)_|     ');
        writeln('                         (_____|             ');
        writeln;
        writeln;
    end;

procedure fim;
    begin
        ClrScr;
        writeln;
        writeln('                  _          _               ');
        writeln('                 | |        | |              ');
        writeln('  ____   ____  _ | | ____   | | _  _   _     ');
        writeln(' |    \ / _  |/ || |/ _  )  | || \| | | |    ');
        writeln(' | | | ( ( | ( (_| ( (/ /   | |_) ) |_| |    ');
        writeln(' |_|_|_|\_||_|\____|\____)  |____/ \__  |    ');
        writeln('                                  (____/     ');
        writeln;
        writeln('                 _       _                   ');
        writeln('                | |     (_)                  ');
        writeln('   ____ ___   _ | | ____ _  ____  ___        ');
        writeln('  / ___) _ \ / || |/ ___) |/ _  |/ _ \       ');
        writeln(' | |  | |_| ( (_| | |   | ( ( | | |_| |      ');
        writeln(' |_|   \___/ \____|_|   |_|\_|| |\___/       ');
        writeln('                         (_____|            ');
        writeln;
    end;

begin
    ClrScr;
    flag1 := false;
    
    inicio;
    writeln();
    writeln('-- Pressione <Enter> para registar --');
    readln();
    
    ClrScr;
    writeln();
    write('Nome de utilizador: ');
    readln(user);
    
    repeat
        pr1;
        writeln('Deseja gerar uma password automaticamente? [S/N]');
        readln(op1);
    until (op1 = 's') or (op1 = 'n') or (op1 = 'S') or (op1 = 'N');
    
    repeat 
        password := '';
        password2 := '';
        tamanho := 50;
        j := 0;
        count := 0;
        count2 := 0;
        
        if (op1 = 's') or (op1 = 'S') then
            begin
                flag1 := true;
                break;
            end
        else 
            begin
                pr1;
                write('Password: ');
                
                for i := 1 to tamanho do 
                    begin
                        key[i] := ReadKey;
                        num := ord(key[i]);
                            
                        if (num <> 32) and (num <> 9) and (num <> 13) and (num <> 8) then   
                            begin
                                password := password + key[i];
                                j := j + 1;
                                count := count + 1;
                                    
                                pr1;
                                write('Password: ');
                                for k := 1 to j do   
                                    write('*');
                            end
                        else if (num = 8) and ((count - count2) > 0) then
                            begin
                                lastChar := length(password);
                                delete(password, lastChar, 1);
                                j := j - 1;
                                tamanho := tamanho + 1;
                                count2 := count2 + 1;
                                    
                                pr1;
                                write('Password: ');
                                for k := 1 to j do 
                                    write('*'); 
                                    
                            end 
                        else if (num = 13) or (num = 27) then 
                            break; 
                    end;
                    
                repeat 
                    pr1;
                    write('Password: ');
                    for i2 := 1 to length(password) do 
                        write('*');
                    writeln();
                    write('Confirme a password: ');
                        
                    tamanho := 50;
                    j := 0;
                    count := 0;
                    count2 := 0;
                    password2 := '';
                        
                    for i := 1 to tamanho do 
                        begin
                            key2[i] := ReadKey;
                            num := ord(key2[i]);
                
                            if (num <> 32) and (num <> 9) and (num <> 13) and (num <> 8) then   
                                begin
                                    password2 := password2 + key2[i];
                                    j := j + 1;
                                    count := count + 1;
                                        
                                    pr1;
                                    write('Password: ');
                                    for i2 := 1 to length(password) do 
                                        write('*');
                                        
                                    writeln();
                                    write('Confirme a password: ');
                                    for k := 1 to j do   
                                        write('*');
                                end
                            else if (num = 8) and ((count - count2) > 0) then
                                begin
                                    lastChar := length(password2);
                                    delete(password2, lastChar, 1);
                                    j := j - 1;
                                    tamanho := tamanho + 1;
                                    count2 := count2 + 1;
                                        
                                    pr1;
                                    write('Password: ');
                                    for i2 := 1 to length(password) do 
                                        write('*');
                                        
                                    writeln();
                                    write('Confirme a password: ');
                                    for k := 1 to j do 
                                        write('*'); 
                                    
                                end 
                            else if (num = 13) or (num = 27) then 
                                break; 
                        end;
                        
                    if (password <> password2) then
                        begin
                            ClrScr;
                            writeln();
                            writeln('Erro. Confirme novamente [1] ou introduza novamente a password [2]');
                            readln(op2);
                        end;
                            
                until (password = password2) or (op2 = '2');
            end;
    until (password = password2);
    
    if (flag1 = true) then
        begin
            randomize;
            pr1;
            write('Password: ');
            a := chr(random(9) + 48);
            b := chr(random(25) + 65);
            c := chr(random(25) + 97);
            d := chr(random(25) + 97);
            e := chr(random(9) + 48);
            password := concat(a, b, c, d, e);
            write(password);
            writeln;
            
            delay (600);
            writeln;
            writeln ('Loading');
            delay (600);
            pr1;
            write('Password: ');
            write(password);
            writeln;
            writeln;
            writeln ('Loading.');
            delay (600);
            pr1;
            write('Password: ');
            write(password);
            writeln;
            writeln;
            writeln ('Loading..');
            delay (600);
            pr1;
            write('Password: ');
            write(password);
            writeln;
            writeln;
            writeln ('Loading...');
            delay (600);
            clrscr;
        end;
    
    if (flag1 = false) then
        begin
            delay (400);
            writeln;
            writeln;
            writeln ('Loading');
            delay (400);
            pr2;
            writeln;
            writeln ('Loading.');
            delay (400);
            pr2;
            writeln;
            writeln ('Loading..');
            delay (400);
            pr2;
            writeln;
            writeln ('Loading...');
            delay (400);
        end;
        
    clrscr;
    writeln;
    write('Nome da sua empresa: ');
    readln(empresa);
    
    writeln('Numero de telemovel: ');
    writeln ('(Opcional, pode escrever <skip> ou <s> para passar a frente) ');
    gotoxy(22,3);
    readln(t1);
    t2 := length(t1);
    if (t2 <> 9) xor (t1 = 's') xor (t1 = 'skip') then
        begin
            while (t2 <> 9) do 
                begin
                    pr5;
                    writeln('Invalido, tente novamente.');
                    delay(500);
                    pr5;
                    gotoxy(22,3);
                    readln(t1);
                    t2 := length(t1);
                    if (t1 = 'skip') or (t1 = 's') then
                        break;
                end;
        end;
    
    writeln;
    write('Produto que comercializa: ');
    readln(produto);
    
    for i := 1 to 2 do 
        for i2 := 1 to 3 do 
            begin
                repeat 
                    pr3;
                    write(' - No ', i, ' ano, qual foi o custo dos(as) ', produto, ' no ', i2, ' quadrimestre? ');
                    readln(UserInput);
                    val(UserInput, num, error);
                        
                    if error = 0 then
                        custo[i, i2] := num
                    else
                        begin
                            writeln;
                            writeln('Inválido, tente novamente.');
                            delay(1000);
                        end;
                until (error = 0);
                
                repeat 
                    pr3;
                    write(' - No ', i, ' ano, quanto ganhou com as vendas dos(as) ', produto, ' no ', i2, ' quadrimestre? ');
                    readln(UserInput);
                    val(UserInput, num, error);
                        
                    if error = 0 then
                        vendas[i, i2] := num
                    else
                        begin
                            writeln;
                            writeln('Inválido, tente novamente.');
                            delay(1000);
                        end;
                until (error = 0);
            end;
            
    for i := 1 to 2 do 
        for i2 := 1 to 3 do 
            balanco[i,i2] := vendas[i, i2] - custo[i, i2];
    
            
    pr3;
    write('Loading');
    delay (400);
    pr3;
    write('Loading.');
    delay (400);
    pr3;
    write('Loading..');
    delay (400);
    pr3;
    write('Loading...');
    delay (400);
    
    clrscr;
    
    writeln;
    writeln('-- Pressione <Enter> para fazer Login -- ');
    readln;
    
    repeat
        clrscr;
        writeln;
        writeln('-- Login --');
        write('Username: ');
        readln(user2);
        write('Password: ');
        
        tamanho := 50;
        j := 0;
        count := 0;
        count2 := 0;
        password3 := '';
                        
        for i := 1 to tamanho do 
            begin
                key3[i] := ReadKey;
                num := ord(key3[i]);
                
                if (num <> 32) and (num <> 9) and (num <> 13) and (num <> 8) then   
                    begin
                        password3 := password3 + key3[i];
                        j := j + 1;
                        count := count + 1;
                            
                        pr4;
                        for k := 1 to j do   
                            write('*');
                    end
                else if (num = 8) and ((count - count2) > 0) then
                    begin
                        lastChar := length(password3);
                        delete(password3, lastChar, 1);
                        j := j - 1;
                        tamanho := tamanho + 1;
                        count2 := count2 + 1;
                                        
                        pr4;
                        for k := 1 to j do 
                            write('*'); 
                    end 
                else if (num = 13) or (num = 27) then 
                    break; 
            end;
    
        if (user <> user2) then
            begin
                writeln;
                writeln('Username incorreto, tente novamente.');
                delay(600);
            end
        else if (password <> password3) then
            begin
                writeln;
                writeln('Password incorreta, tente novamente.');
                delay(600);
            end;
    until (password3 = password) and (user = user2);
    
    repeat
        menu;
        readln(op3);

        case op3 of
            '1':begin
                    // Vendas Quadrimestrais
                    clrscr;
                    writeln;
                    vendasPrint;
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '2':begin
                    // Total das Vendas anual
                    clrscr;
                    writeln;
                    writeln('Total das Vendas anual do produto ', produto, ':');
                    totalAnualArr(vendas);
                    writeln;
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '3':begin
                    // Total das Vendas
                    clrscr;
                    writeln;
                    writeln('O valor total das vendas foi ', totalArr(vendas):0:2, '$.');
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '4':begin
                    // Media das Vendas
                    clrscr;
                    writeln;
                    media := (totalArr(vendas) / 6);
                    writeln('A media das vendas do produto ', produto, ' é ', media:0:2, '$.');
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '5':begin
                    // Maximo das Vendas
                    clrscr;
                    writeln;
                    writeln('Maximo das Vendas');
                    maxarr(vendas);
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '6':begin
                    // Minimo das Vendas
                    clrscr;
                    writeln;
                    writeln('Minimo das Vendas');
                    minarr(vendas);
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '7':begin
                    // Custos Quadrimestrais
                    clrscr;
                    writeln;
                    custoPrint;
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '8':begin
                    // Total dos Custos anual
                    clrscr;
                    writeln;
                    writeln('Total dos Custos anual: ');
                    totalAnualArr(custo);
                    writeln;
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '9':begin
                    // Total dos Custos
                    clrscr;
                    writeln;
                    writeln('O valor total dos custos foi ', totalArr(custo):0:2, '$.');
                    
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '10':begin
                    // Media dos Custos
                    clrscr;
                    writeln;
                    media := (totalArr(custo) / 6);
                    writeln('A media dos custos do produto ', produto, ' é ', media:0:2, '$.');
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '11':begin
                    // Maximo dos Custos
                    clrscr;
                    writeln;
                    writeln('Maximo dos Custos');
                    maxarr(custo);
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '12':begin
                    // Minimo dos Custos
                    clrscr;
                    writeln;
                    writeln('Minimo dos Custos');
                    minarr(custo);
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '13':begin
                    // Balanco Quadrimestral
                    clrscr;
                    writeln;
                    balancoPrint;
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '14':begin
                    // Balanco anual
                    clrscr;
                    writeln;
                    writeln('Balanco anual: ');
                    totalAnualArr(balanco);
                    writeln;
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '15':begin
                    // Balanco Total
                    clrscr;
                    writeln;
                    writeln('O balanco total equivale a ', totalArr(balanco):0:2, '$.');
                    
                    if (totalArr(balanco) > 0) then
                        writeln('Parabens, o balanco total é positivo.')
                    else if (totalArr(balanco) < 0) then
                        writeln('O balanco total é negativo, terá de melhorar as vendas.')
                    else
                        writeln('O balanco total é igual a 0, terá de melhorar as vendas.');
                        
                    writeln;
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '16':begin
                    // Media do balanco
                    clrscr;
                    writeln;
                    media := (totalArr(balanco) / 6);
                    writeln('A media do balanco do produto ', produto, ' é ', media:0:2, '$.');
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '17':begin
                    // Maximo do balanco
                    clrscr;
                    writeln;
                    writeln('Maximo do balanco');
                    maxarr(balanco);
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '18':begin
                    // Minimo do balanco
                    clrscr;
                    writeln;
                    writeln('Minimo do balanco');
                    minarr(balanco);
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
            '19':begin
                    // Info
                    clrscr;
                    writeln;
                    writeln('Username: ', user);
                    write('Password: ');
                    for i := 1 to length(password) do 
                        write('*');
                    writeln();
                    writeln('Nome da empresa: ', empresa);
                    if (t2 = 9) then
                        writeln('Numero de telemovel: ', t1);
                    writeln('Produto que comercializa: ', produto);
                    writeln;
                    writeln('Pressione <Enter> para voltar ao menu. ');
                    readln;
                end;
        end;
        
    until (op3 = '0');
    
    fim;
    readln;
end.





