-- ghdl -a mux2x4_bonito.vhdl tb_mux2x4_bonito.vhdl
-- ghdl -r tb_mux2x4_bonito --stop-time=20ns --wave=tb_mux2x4_bonito.ghw

entity tb_mux2x4_bonito is

end entity;

architecture comuta of tb_mux2x4_bonito is
    component mux2x4_bonito is
        port(
            c0  : in  bit_vector(3 downto 0);
            c1  : in  bit_vector(3 downto 0);
            sel : in  bit;
            zc  : out bit_vector(3 downto 0)
        );
    end component;

    signal sc0  : bit_vector(3 downto 0);
    signal sc1  : bit_vector(3 downto 0);
    signal ssel : bit;
    signal szc  : bit_vector(3 downto 0);
begin

    u_mux2x4 : mux2x4_bonito port map
    (sc0,    -- canal 0
     sc1,    -- canal 1
     ssel,   -- seletor
     szc);   -- saídas com comando vhdl

    u_tb : process
    begin
        sc0 <= "0001";

        sc1 <= "1100";

        ssel <= '0';
        wait for 10 ns;

        ssel <= '1';
        wait for 10 ns;

        wait;
    end process;
    

end architecture;
