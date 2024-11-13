with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body PrimeNumbers is
    procedure Compute_Sieve (s : Sieve_Ptr) is
        i, j, k : Natural;
    begin
        s(2) := True;
        for u in 3..s'Last loop
            s(u) := u mod 2 /= 0;
        end loop;
        k := Natural(Float'Floor(Sqrt(Float(s'Length))));
        i := 3;
        while i <= k loop
            if s(i) then
                j := i + i;
                while j <= s'Last loop
                    s(j) := False;
                    j := j + i;
                end loop;
            end if;
            i := i + 2;
        end loop;
    end Compute_Sieve;

    function Count_Primes (s : Sieve_Ptr) return Natural is
        c : Natural := 0;
    begin
        for i in s'Range loop
            if s(i) then
                c := c + 1;
            end if;
        end loop;
        return c;
    end Count_Primes;
end PrimeNumbers;
