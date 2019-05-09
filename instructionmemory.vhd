----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:31:10 12/08/2016 
-- Design Name: 
-- Module Name:    instructionmemory - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instructionmemory is
    Port ( pc : in  STD_LOGIC_VECTOR (31 downto 0);
           data : out  STD_LOGIC_VECTOR (31 downto 0));
end instructionmemory;

architecture Behavioral of instructionmemory is

type A is array (0 to 63) of std_logic_vector (7 downto 0);

signal mem : A := ("00000001" ,"00001001" ,"01011000" ,"00100000",   --0  => 3  add
                   "10101101" ,"00001011" ,"00000000" ,"00000000",   --4  => 7  sw
						 "00010001" ,"00101010" ,"00000000" ,"00000001",   --8  => 11 beq
						 "10001101" ,"00001100" ,"00100000" ,"00000000",   --12 => 15 lw
						 "00001101" ,"00001101" ,"00000000" ,"00000000",   --16 => 19 lw
						 "00000100" ,"00001001" ,"00000000" ,"00000001",   --20 => 23 beq
						 "00000001" ,"00001001" ,"01110000" ,"00100100",   --24 => 27 and
						 "00000001" ,"00001001" ,"01111000" ,"00100100",   --28 => 31  or
						 "00000001" ,"00001001" ,"10001000" ,"00100010",   --32 => 35 sub
                   "00000001" ,"00001001" ,"10001000" ,"00101010",   --36 => 39 slt
						 "00000001" ,"00101000" ,"10010000" ,"00101010",   --40 => 43 slt
						 "00000000" ,"00000000" ,"00000000" ,"00000000",   --44 => 47
						 "00000000" ,"00000000" ,"00000000" ,"00000000",   --48 => 51
						 "00000000" ,"00000000" ,"00000000" ,"00000000",   --52 => 55
						 "00000000" ,"00000000" ,"00000000" ,"00000000",   --56 => 59
						 "00000000" ,"00000000" ,"00000000" ,"00000000");  --60 => 63


begin

process (pc)

begin

data (31 downto 24) <= mem(conv_integer(pc));
data (23 downto 16) <= mem(conv_integer(pc) + 1);
data (15 downto 8)  <= mem(conv_integer(pc) + 2);
data (7 downto 0)   <= mem(conv_integer(pc) + 3);	

end process;
end Behavioral;

