entity mux2x8 is
    port(
        c0  : in  bit_vector(7 downto 0);  -- Entrada de 8 bits (canal 0)
        c1  : in  bit_vector(7 downto 0);  -- Entrada de 8 bits (canal 1)
        sel : in  bit;                     -- Sinal de seleção (1 bit)
        zc  : out bit_vector(7 downto 0)   -- Saída de 8 bits
    );
end entity;

architecture comuta of mux2x8 is
    begin
        -- Seleção de sinais: se sel = '0', zc recebe c0; se sel = '1', zc recebe c1.
        zc <= c0 when sel = '0' else c1;
    end architecture;
    