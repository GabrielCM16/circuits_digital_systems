-- ghdl -a mux2x1.vhdl tb_mux2x1.vhdl
-- ghdl -r tb_mux2x1 --stop-time=80ns --wave=tb_mux2x1.ghw

entity tb_mux2x1 is

end entity;

architecture comuta of tb_mux2x1 is
    component mux2x1 is
        port(
            c0  : in  bit;
            c1  : in  bit;
            sel : in  bit;
            zpl : out bit
        );
    end component;

    signal s0, s1, ssel, spl : bit;
begin

    u_mux2x1 : mux2x1 port map
    (s0,s1,ssel,spl);

    u_tb : process
    begin
        -- sit 00
        s0   <= '0';
        s1   <= '0';
        ssel <= '0';
        wait for 10 ns;

        -- sit 01
        s0   <= '0';
        s1   <= '0';
        ssel <= '1';
        wait for 10 ns;

        -- sit 02
        s0   <= '0';
        s1   <= '1';
        ssel <= '0';
        wait for 10 ns;

        -- sit 03
        s0   <= '0';
        s1   <= '1';
        ssel <= '1';
        wait for 10 ns;

        -- sit 04
        s0   <= '1';
        s1   <= '0';
        ssel <= '0';
        wait for 10 ns;

        -- sit 05
        s0   <= '1';
        s1   <= '0';
        ssel <= '1';
        wait for 10 ns;

        -- sit 06
        s0   <= '1';
        s1   <= '1';
        ssel <= '0';
        wait for 10 ns;

        -- sit 07
        s0   <= '1';
        s1   <= '1';
        ssel <= '1';
        wait for 10 ns;

        wait;
    end process;
    

end architecture;
