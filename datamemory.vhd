----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:56:37 12/08/2016 
-- Design Name: 
-- Module Name:    datamemory - Behavioral 
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

entity datamemory is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           writedata : in  STD_LOGIC_VECTOR (31 downto 0);
           memwrite : in  STD_LOGIC;
           memread : in  STD_LOGIC;
           readdata : out  STD_LOGIC_VECTOR (31 downto 0));
end datamemory;

architecture Behavioral of datamemory is


type A is array (0 to 31) of std_logic_vector (7 downto 0);

signal mem : A;

begin

process (address, writedata, memwrite, memread)

begin

if (memread = '0' and memwrite = '1')
    then mem(conv_integer(address)) <= writedata (31 downto 24);
	      mem(conv_integer(address) + 1) <= writedata (23 downto 16);
			mem(conv_integer(address) + 2) <= writedata (15 downto 8);
			mem(conv_integer(address) + 3) <= writedata (7 downto 0);
elsif (memread = '1' and memwrite = '0')
    then readdata (31 downto 24) <= mem(conv_integer(address));
         readdata (23 downto 16) <= mem(conv_integer(address) + 1);
         readdata (15 downto 8)  <= mem(conv_integer(address) + 2);
         readdata (7 downto 0)   <= mem(conv_integer(address) + 3);			
end if;
end process;
end Behavioral;

