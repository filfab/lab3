with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Unchecked_Deallocation;

procedure newton is
    type Tablica is array(Natural range <>) of Natural;
    type Tablica_Ptr is access Tablica;

    procedure Free is
        new Standard.Ada.Unchecked_Deallocation(Tablica, Tablica_Ptr);

    n, k : Natural;
    t : Tablica_Ptr;
begin
    if Argument_Count = 0 then
        Put("Podaj pierwszy argument: ");
        Get(n);
        Put("Podaj drugi argument: ");
        Get(k);
    elsif Argument_Count = 2 then
        n := Natural'Value(Argument(1));
        k := Natural'Value(Argument(1));
        if k > n then
            Put("Niepoprawny drugi argument");
            return;
        end if;
    else
        Put("Niepoprawna liczba argumentów");
        return;
    end if;

    if k > n then k := n-k; end if;

    t := new Tablica(0..n);
    t(0) := 1;
    t(1) := 1;

    for i in 2..n loop
        t(i) := 0;
        if i < k then
            for j in reverse 1..i loop
                t(j) := t(j) + t(j-1);
            end loop;
        else
            for j in reverse 1..k loop
                t(j) := t(j) + t(j-1);
            end loop;
        end if;
    end loop;

    Put(t(k), Width => 0);
    Free(t);
end newton;