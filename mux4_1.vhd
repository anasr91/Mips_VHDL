----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:37:07 10/10/2016 
-- Design Name: 
-- Module Name:    mux4_1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux4_1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           z : out  STD_LOGIC);
end mux4_1;

architecture Behavioral of mux4_1 is

component mux2_1 is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           s : in  STD_LOGIC;
           z : out  STD_LOGIC);
end component;

signal t1,t2 :STD_LOGIC;


begin

M1: mux2_1 port map(a ,b ,s(0) ,t1);
M2: mux2_1 port map(c ,d ,s(0) ,t2);
M3: mux2_1 port map(t1 ,t2 ,s(1) ,z);

end Behavioral;

