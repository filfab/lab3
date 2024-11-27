with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Unchecked_Deallocation;

procedure Nth_prime is
   function n_prime (n : Positive) return Positive is
      type PrimesArr is array(Positive range 1..n) of Natural;

      suspected : Positive := 3;
      counter : Positive := 1;
      sus_is_prime : Boolean;
      primes : PrimesArr;
   begin
      primes(1) := 2;

   while counter < n loop
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
   return primes(n);
   end n_prime;


   function Input return Positive is
      n : Positive;
   begin
      if Argument_Count = 0 then
         Put("Podaj liczbę: ");
         Get(n);
      elsif Argument_Count = 1 then
         n := Positive'Value(Argument(1));
      else
         raise PROGRAM_ERROR with "Niepoprawna liczba argumentów";
      end if;
      return n;
   end Input;


   procedure Ounput (n, prime : Positive) is
   begin
      Put(n ,Width => 0); 
      if n mod 10 = 1 then
         Put_Line("-sza liczba pierwsza:" & prime'Image);
      elsif n mod 10 = 2 then
         Put_Line("-ga liczba pierwsza:" & prime'Image);
      elsif n mod 10 = 3 then
         Put_Line("-cia liczba pierwsza:" & prime'Image);
      elsif n mod 100 = 0 then
         Put_Line("-na liczba pierwsza:" & prime'Image);
      else
         Put_Line("-ta liczba pierwsza:" & prime'Image);
      end if;
   end Ounput;

   n, prime : Positive;
begin
   n := Input;
   
   prime := n_prime(n);

   Ounput(n, prime);
end nth_prime;