-- Entidade
entity pl_xor is
    port(
        A : in  bit;
        B : in  bit;
        S : out bit
    );
end pl_xor;

-- Comportamento
architecture comportamento of pl_xor is
begin
    S <= A xor B;  -- Implementação da lógica XOR
end comportamento;
