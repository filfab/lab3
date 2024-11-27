with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Unchecked_Deallocation;
with PrimeNumbers; use PrimeNumbers;

procedure PrimeNumbersTest is
    procedure Free is
        new Standard.Ada.Unchecked_Deallocation(Sieve, Sieve_Ptr);

    n : Natural;
    c : Natural := 0;
    s : Sieve_Ptr;
begin
    if Argument_Count = 0 then
        Put("Podaj liczbe: ");
        Get(n);
    elsif Argument_Count = 1 then
        n := Natural'Value(Argument(1));
    else
        Put("Niepoprawna liczba argumentów");
        return;
    end if;

    s := new Sieve(2..n);
    Compute_Sieve(s);
    c := Count_Primes(s);
    Free(s);
    Put(c'Image);
end PrimeNumbersTest;
