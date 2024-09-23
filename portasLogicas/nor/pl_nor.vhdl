-- Entidade
entity pl_nor is
    port(
        A : in  bit;
        B : in  bit;
        S : out bit
    );
end pl_nor;

-- Comportamento
architecture comportamento of pl_nor is
begin
    S <= not (A or B);  -- Implementação da lógica NOR
end comportamento;
