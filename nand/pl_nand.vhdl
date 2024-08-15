-- Entidade
entity pl_nand is
    port(
        A : in  bit;
        B : in  bit;
        S : out bit
    );
end pl_nand;

-- Comportamento
architecture comportamento of pl_nand is
begin
    S <= not (A and B);  -- Implementação da lógica NAND
end comportamento;
