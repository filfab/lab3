with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Unchecked_Deallocation;

procedure nthprime is
    type PrimesArr is array(Positive range <>) of Natural;
    type PrimesArr_Ptr is access PrimesArr;

    procedure Free is
        new Standard.Ada.Unchecked_Deallocation(PrimesArr, PrimesArr_Ptr);

    n : Positive;
    suspected : Positive := 3;
    counter : Positive := 1;
    sus_is_prime : Boolean;
    primes : PrimesArr_Ptr;
begin
    if Argument_Count = 0 then
        Put("Podaj liczbę: ");
        Get(n);
    elsif Argument_Count = 1 then
        n := Positive'Value(Argument(1));
    else
        Put_Line("Niepoprawna liczba argumentów");
        return;
    end if;

    primes := new PrimesArr(1..n);
    primes(1) := 2;

    while counter < n loop
        test := test + 1;
        sus_is_prime := True;
        for i in 2..counter loop
            if suspected mod primes(i) = 0 then
                sus_is_prime := False;
                exit;
            end if;
        end loop;

        if sus_is_prime then
            primes(counter+1) := suspected;
            counter := counter + 1;
        end if;
        suspected := suspected + 2;
    end loop;

    Put(n ,Width => 0); 
    if n mod 10 = 1 then
        Put_Line("-sza liczba pierwsza:" & primes(n)'Image);
    elsif n mod 10 = 2 then
        Put_Line("-ga liczba pierwsza:" & primes(n)'Image);
    elsif n mod 10 = 3 then
        Put_Line("-cia liczba pierwsza:" & primes(n)'Image);
    elsif n mod 100 = 0 then
        Put_Line("-na liczba pierwsza:" & primes(n)'Image);
    else
        Put_Line("-ta liczba pierwsza:" & primes(n)'Image);
    end if;

    Free(primes);
end nthprime;