Phonon dispersion in bulk si created with phonopy and Quantum ESPRESSO.

The basic idea is to take finite derivative of the force acting on atoms to generate harmonic force constants. This is done by displacing atoms by a small amount and calculating the change in force. This is called the 'frozen phonon' method (as compared to DFPT which is quite different). To get good results, you need a large supercell so that the interactions across periodic boundaries due to the displacement are negligible. 

The input file, si.in, provides the basic setup. This file is for a si 8-atom conventional cell. The supercell calculations uses an 2x2x2 supercell which matches reference data well. To create a supercell:

phonopy --qe -d --dim="2 2 2" -c si.in

This will create the files 'supercell.in' and 'supercell-xxx.in' where the xxx are numbers. supercell.in contains the perfect supercell structure. The xxx file contain copies of the supercell with atoms displaced to compute forces. For cubic si, phonopy only creates one xxx file, supercell-001.in. This is all that is needed due to symmetry. Also, phonopy only copies structure information over. You have to copy all of the system setup info into the supercell files before running them. IMPORTANT: also add 'tprnfor=.true.' and 'tstress=.true.' under the '&control' namelist or QE won't output the forces and you'll have to run it again!

Now run the supercell calculation to get the change in forces. 

mpirun -np [N] path/to/quantum/espress/executables/pw.x < supercell-001.in > supercell-001.out

Once this is done, you can generate the force file using phonopy. Note that phonopy assumes that in the original undistorted structure is the equilibrium structure, i.e. the forces are identically 0. To create the force file:

phonopy --qe -f supercell-001.out

Also note that to create this file, this command needs to be run in the directory containiny 'disp_phonopy.yaml' or some similar name. Phonopy writes this file when creating the distorted supercells. 

Now you can do 2 things: you can use the phonopy force file, 'FORCE_SETS' in SNAXS to simulate x-ray and neutron scattering (see my note at the end of this). Or you can directly calculate, e.g. dispersion, using phonopy. To calculate dispersion, you need to have a setting file. Here, that file is called 'band.conf' which has some pretty self explanatory settings in it. You can find out what goes in this file on the phonopy website.

phonopy --qe -c si.in -p band.conf

Note that phonopy automatically converts the supercell data into dispersion for the irreducible FCC solid.

~~~~~~~~~~~~~~~~~~~~~~~~~~
NOTE: SNAXS expects the FORCE_SETS file to have units d = Angstrom and F = eV/Angstrom. The FORCE_SETS file using the --qe option, i.e. in Quantum ESPRESSO unit, are d = Bohr and F = Ry/Bohr. You have to convert them. It is straightforward and I wrote a really simple python program 'qe2snaxs' that does it automatically. You can find this program in my snaxs repository on github (github.com/tyst3273/snaxs).

