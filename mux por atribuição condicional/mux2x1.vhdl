entity mux2x1 is
    port(
        c0  : in  bit;
        c1  : in  bit;
        sel : in  bit;
        zcm : out bit   -- saída por comando de seleção
    );
end entity;

architecture comuta of mux2x1 is
begin
    -- comando vhdl de seleção de sinais
    zcm <= c0 when sel = '0' else c1;

end architecture;
