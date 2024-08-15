-- Entidade
entity pl_xnor is
    port(
        A : in  bit;
        B : in  bit;
        S : out bit
    );
end pl_xnor;

-- Comportamento
architecture comportamento of pl_xnor is
begin
    S <= not (A xor B);  -- Implementação da lógica XNOR
end comportamento;
