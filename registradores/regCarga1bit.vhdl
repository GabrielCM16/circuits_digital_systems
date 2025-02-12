library ieee;
use ieee.std_logic_1164.all;

entity regCarga1bit is
    port(
        d   : in std_logic;
        clk : in std_logic;
        pr, cl : in std_logic;
        nrw : in std_logic;
        s   : out std_logic
    );
end entity regCarga1bit;

architecture reg1bit of regCarga1bit is
    component ffd is
        port(
            d   : in std_logic;
            clk : in std_logic;
            pr, cl : in std_logic;
            q, nq : out std_logic
        );
    end component;

    signal datain, dataout : std_logic;

begin
    -- Envio de dataout para saída s
    s <= dataout;

    -- Multiplexador
    -- nrw = '1' -> Entrada principal de interface d
    -- nrw = '0' -> Saída temporária dataout (mantém estado)
    datain <= d when nrw = '1' else dataout;

    -- Instância do registrador
    u_reg : ffd 
        port map(
            d   <= datain,
            clk <= clk,
            pr  <= pr,
            cl  <= cl,
            q   <= dataout
        );
end architecture reg1bit;
