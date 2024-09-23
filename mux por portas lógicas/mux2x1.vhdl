entity mux2x1 is
    port(
        c0  : in  bit;
        c1  : in  bit;
        sel : in  bit;
        zpl : out bit   -- saída por porta lógica
    );
end entity;

architecture comuta of mux2x1 is
begin
    -- usando portas lógicas
    zpl <= (c0 and not(sel)) or (c1 and sel);

end architecture;
