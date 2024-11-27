entity semaforo_tb is

end semaforo_tb;

architecture tb of semaforo_tb is
    component semaforo is
        port(
        sensorA : in bit;
        sensorB : in bit;
        lga : out bit;
        lgb : out bit;
        lra : out bit;
        lrb : out bit
    );
    end component;
    signal sA, sB : bit;
    signal sLGA, sLGB, sLRA, sLRB : bit;

begin
    u_semaforo : semaforo port map (sA, sB, sLGA, sLGB, sLRA, sLRB);
    u_tb : process

begin
    sA <= '0';
    sB <= '0';
    wait for 10 ns;
    sA <= '0';
    sB <= '1';
    wait for 10 ns;
    sA <= '1';
    sB <= '0';
    wait for 10 ns;
    sA <= '1';
    sB <= '1';
    wait for 10 ns;
    wait;
    end process u_tb;

end tb;
