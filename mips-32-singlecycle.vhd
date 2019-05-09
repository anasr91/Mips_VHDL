----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:00 12/28/2016 
-- Design Name: 
-- Module Name:    mips-32-singlecycle - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mips_32_singlecycle is
    Port ( clock : in  STD_LOGIC;
           instructionin : in  STD_LOGIC_VECTOR (31 downto 0));
end mips_32_singlecycle;

architecture Behavioral of mips_32_singlecycle is

COMPONENT ALUOp
	PORT(
		func : IN std_logic_vector(5 downto 0);
		aluop : IN std_logic_vector(1 downto 0);          
		op : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	

COMPONENT add4
	PORT(
		a : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;          
		z : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
	COMPONENT add
	PORT(
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);          
		c : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
	
	COMPONENT alu
	PORT(
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);
		s : IN std_logic_vector(3 downto 0);          
		z : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;



	COMPONENT controlunit
	PORT(
		opcode : IN std_logic_vector(5 downto 0);          
		aluop : OUT std_logic_vector(1 downto 0);
		branch : OUT std_logic;
		regdst : OUT std_logic;
		alusrc : OUT std_logic;
		memtoreg : OUT std_logic;
		regwrite : OUT std_logic;
		memread : OUT std_logic;
		memwrite : OUT std_logic
		);
	END COMPONENT;
	
	
	COMPONENT datamemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		writedata : IN std_logic_vector(31 downto 0);
		memwrite : IN std_logic;
		memread : IN std_logic;          
		readdata : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;



	COMPONENT instructionmemory
	PORT(
		pc : IN std_logic_vector(31 downto 0);          
		data : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
	
	COMPONENT pc
	PORT(
		a : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;          
		b : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


COMPONENT registerfile
	PORT(
		rs : IN std_logic_vector(4 downto 0);
		rt : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		data : IN std_logic_vector(31 downto 0);
		regwrite : IN std_logic;          
		readdata1 : OUT std_logic_vector(31 downto 0);
		readdata2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	

COMPONENT shiftleft2
	PORT(
		x : IN std_logic_vector(31 downto 0);          
		z : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
		COMPONENT signextend
	PORT(
		x : IN std_logic_vector(15 downto 0);          
		z : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	

COMPONENT muxaddtopc
	PORT(
		x : IN std_logic_vector(31 downto 0);
		y : IN std_logic_vector(31 downto 0);
		s : IN std_logic;          
		z : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	

	

COMPONENT muxdmemtoreg
	PORT(
		x : IN std_logic_vector(31 downto 0);
		y : IN std_logic_vector(31 downto 0);
		s : IN std_logic;          
		z : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	



COMPONENT muxmemtoreg
	PORT(
		x : IN std_logic_vector(4 downto 0);
		y : IN std_logic_vector(4 downto 0);
		s : IN std_logic;          
		z : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;

	
COMPONENT muxregtoalu
	PORT(
		x : IN std_logic_vector(31 downto 0);
		y : IN std_logic_vector(31 downto 0);
		s : IN std_logic;          
		z : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
	
signal regdst : std_logic ;            --control signals
signal branch : std_logic ;
signal memread : std_logic ;
signal memtoreg : std_logic ;
signal aluOPP : std_logic_vector (1 downto 0) ;
signal memwrite : std_logic ;
signal alusrc : std_logic ;            
signal regwrite : std_logic ;          --control signals



signal readdata1 : std_logic_vector (31 downto 0);
signal readdata2 : std_logic_vector (31 downto 0);

signal writereg : std_logic_vector (4 downto 0);
signal writedata : std_logic_vector (31 downto 0);

signal signextendOP : std_logic_vector (31 downto 0);

signal aluIN : std_logic_vector (31 downto 0);
signal alucontrolop : std_logic_vector (3 downto 0);
signal aluzero : std_logic ;
signal aluresult : std_logic_vector(31 downto 0);
signal mem_readdata : std_logic_vector(31 downto 0);
signal shiftop : std_logic_vector (31 downto 0);
signal pcin : std_logic_vector (31 downto 0);
signal shiftmux : std_logic_vector (31 downto 0);
signal add4op : std_logic_vector (31 downto 0);
signal aluaddop : std_logic_vector (31 downto 0);
signal add4in : std_logic := '0';
signal pcop : std_logic_vector (31 downto 0);
signal instruction : std_logic_vector(31 downto 0);	

begin


Inst_ALUOp: ALUOp PORT MAP(
		func => instruction (5 downto 0),
		aluop => aluOPP,
		op => alucontrolOP
	);



	Inst_add4: add4 PORT MAP(
		a => pcop,
		z => add4OP,
		clk => add4in
	);


Inst_add: add PORT MAP(
		a => add4OP,
		b => shiftOP,
		c => aluaddOP
	);
	
	
	
	

	Inst_alu: alu PORT MAP(
		a => readdata1,
		b => aluIN,
		s => alucontrolOP,
		z => aluresult
	);



	Inst_controlunit: controlunit PORT MAP(
		opcode => instruction(31 downto 26),
		aluop => aluOPP,
		branch => branch,
		regdst => regdst,
		alusrc => alusrc,
		memtoreg => memtoreg,
		regwrite => regwrite,
		memread => memread,
		memwrite => memwrite
	);
	
	
		Inst_datamemory: datamemory PORT MAP(
		address => aluresult,
		writedata => readdata2,
		memwrite => memwrite,
		memread => memread,
		readdata => mem_readdata
	);


Inst_instructionmemory: instructionmemory PORT MAP(
		pc => pcop,
		data => instruction (31 downto 0)
	);


	
	Inst_pc: pc PORT MAP(
		a => instructionin,
		clk => clock,
		b => pcop
	);


Inst_registerfile: registerfile PORT MAP(
		rs => instruction (25 downto 21),
		rt => instruction (20 downto 16),
		rd => writereg,
		data => writedata,
		regwrite => regwrite,
		readdata1 => readdata1,
		readdata2 => readdata2
	);
	
	
	Inst_shiftleft2: shiftleft2 PORT MAP(
		x => signextendOP,
		z => shiftOP
	);


Inst_signextend: signextend PORT MAP(
		x => instruction(15 downto 0),
		z => signextendOP
	);


Inst_muxaddtopc: muxaddtopc PORT MAP(
		x => add4OP,
		y => aluaddOP,
		s => branch,
		z => pcIN
	);
	


Inst_muxdmemtoreg: muxdmemtoreg PORT MAP(
		x => mem_readdata,
		y => aluresult,
		s => memtoreg,
		z => writedata
	);


Inst_muxmemtoreg: muxmemtoreg PORT MAP(
		x => instruction (20 downto 16),
		y => instruction (15 downto 11),
		s => regdst,
		z => writereg
	);


Inst_muxregtoalu: muxregtoalu PORT MAP(
		x => readdata2,
		y => signextendOP,
		s => alusrc,
		z => aluIN
	);




end Behavioral;

