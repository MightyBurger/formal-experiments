library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.env.finish;

entity counter_tb is
end entity counter_tb;

architecture rtl of counter_tb is

    constant GWIDTH: natural := 3;
    constant CMAX: natural := 7;
    signal clk: std_logic;
    signal rst: std_logic := '1';
    signal incr: std_logic := '0';
    signal decr: std_logic := '0';
    signal count: unsigned(GWIDTH - 1 downto 0);
    
    signal clk_count: integer := 0;
    signal CLK_PERIOD: time := 25 ns;

begin

    counter_inst: entity work.counter(rtl)
    generic map (
        GWIDTH => GWIDTH,
        CMAX => CMAX
    )
    port map (
        clk => clk,
        rst => rst,
        incr => incr,
        decr => decr,
        count => count
    );

    clk_proc: process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    rst_proc: process(clk)
    begin
        if rising_edge(clk) then
            rst <= '0';
        end if;
    end process;

    clk_count_proc: process(clk)
    begin
        if rising_edge(clk) then
            clk_count <= clk_count + 1;
        end if;
    end process;


    stm_proc: process(clk)
    begin
        if rising_edge(clk) then
            case clk_count is

            when 3 to 10 =>
                incr <= '1';
                decr <= '0';

            when 11 =>
                incr <= '0';
                decr <= '1';

            when 12 to 14 =>
                incr <= '1';
                decr <= '1';

            when 15 to 20 =>
                incr <= '0';
                decr <= '1';

            when 30 =>
                finish;

            when others =>
                incr <= '0';
                decr <= '0';

            end case;
        end if;
    end process;

end architecture rtl;