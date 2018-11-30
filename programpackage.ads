with BlockPackage;

package ProgramPackage is

   type Program is record
      blk : BlockPackage.Block;
   end record;
   
   function init(blkIn : BlockPackage.Block) return Program;
   
   procedure execute(self : in out Program);

end ProgramPackage;
