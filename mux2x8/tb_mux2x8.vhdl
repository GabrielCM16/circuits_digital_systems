-- ghdl -a mux2x8.vhdl tb_mux2x8.vhdl
-- ghdl -r tb_mux2x8 --stop-time=20ns --wave=tb_mux2x8.ghw

entity tb_mux2x8 is
    end entity;
    
    architecture comuta of tb_mux2x8 is
        component mux2x8 is
            port(
                c0  : in  bit_vector(7 downto 0);  -- Entrada de 8 bits (canal 0)
                c1  : in  bit_vector(7 downto 0);  -- Entrada de 8 bits (canal 1)
                sel : in  bit;                     -- Sinal de seleção (1 bit)
                zc  : out bit_vector(7 downto 0)   -- Saída de 8 bits
            );
        end component;
    
        -- Sinais de teste para o multiplexador
        signal sc0  : bit_vector(7 downto 0);  -- Entrada de 8 bits (canal 0)
        signal sc1  : bit_vector(7 downto 0);  -- Entrada de 8 bits (canal 1)
        signal ssel : bit;                     -- Sinal de seleção (1 bit)
        signal szc  : bit_vector(7 downto 0);  -- Saída de 8 bits
    begin
    
        -- Instância do multiplexador 2x8
        u_mux2x8 : mux2x8 port map
        (
            c0  => sc0,   -- Canal 0
            c1  => sc1,   -- Canal 1
            sel => ssel,  -- Sinal de seleção
            zc  => szc    -- Saída de 8 bits
        );
    
        -- Processo de simulação
        u_tb : process
        begin
            -- Teste 1: sc0 = "11001100", sc1 = "01010101", ssel = '0'
            sc0 <= "11001100";  -- Canal 0 recebe 11001100
            sc1 <= "01010101";  -- Canal 1 recebe 01010101
            ssel <= '0';        -- Seleciona o canal 0
            wait for 10 ns;
    
            -- Teste 2: Alterar o sinal de seleção para '1', selecionando canal 1
            ssel <= '1';        -- Seleciona o canal 1
            wait for 10 ns;
    
            -- Fim da simulação
            wait;
        end process;
    
    end architecture;
    