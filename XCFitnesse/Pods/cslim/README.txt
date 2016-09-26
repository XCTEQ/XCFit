CSlim - An implementation of FitNesse SliM in C
Authors:  Robert Martin, James Grenning, and Doug Bradbury

************
* Fixtures *
************
Fixtures in CSlim are sets of functions and a data structure that binds them together.   See Main/DecisionTableExample.c

Note that the struct Division is used to hold data for all the functions in this fixture, rather like an object <grin>.

Each function returns a char*, and you'd better control the memory for what it returns. You can return a pointer to a static variable, or to a dynamically allocated buffer.  You can delete dynamically allocated buffers in your "destructor" (see below);  Repeat, every function returns a char*, so if you want to return an integer you'll have to convert it to a char*.  See the ScriptTableExample for a rather discouraging example of way that this needs to be done.

Slim calls your functions with a void* pointer to the fixture data structure.  You'll have to cast the void* if you want to use it.  The functions also take a pointer to a SlimList that contains all the arguments were passed to your function.  These arguments will be strings or other SlimLists, and you'll have to just know which are which.  You should get familiar with the SlimList interface.  It's not very exciting, but you'll be using it a lot.  Take a close look at the QueryTableExample.  It makes considerable use of SlimList, and the related function SlimList_Serialize;

You can cause a slim exception in any function by returning a message with the SLIM_EXCEPTION(reason) macro.  This will turn the cell being executed yellow.  To cause an exception in a Create function (if, for example the wrong number of arguments have been given to it), use the SLIM_CONSTRUCTOR_ERROR(errorHandler, reason) macro.  See Main/ExceptionExample.c for examples of create exceptions.

****************
* Registration *
****************
Notice the CREATE_FIXTURE business at the bottom of the DecisionTableExample.c file.  
CSLIM_CREATE_FIXTURE(Division) 
	CSLIM_FUNCTION(setNumerator)
	CSLIM_FUNCTION(setDenominator)
	CSLIM_FUNCTION(Quotient)
CSLIM_END

This creates a registration function that will be called by the main program of the Slim Server.  It is your responsibility to register your fixture and your functions with these Macros.   

You register a fixture by calling CSLIM_CREATE_FIXTURE(FixtureName).  You must define Create_FixtureName and Destroy_FixtureName in order for this macro to work.  The create function is used to allocate and initialize the fixture data structure.  The destroy function is your destructor.  You use it to free any memory you may have allocated.  If you don't like the naming convention, you can write the registration function yourself.  Have a look at the macro definitions in Fixtures.h.  

You register your functions with the CSLIM_FUNCTION macro with a pointer to the function. 

The names are used by FitNesse match the actual C names by convention, but you can skip the macro and make the call yourself if you'd like to use different names

Now look at the Main/Fixtures.c file.  This is where you tell the main Slim Server program about all your fixtures.  The CSLIM_FIXTURES and CSLIM_FIXTURE macros make this easy.  The fixture name you use in the FIXTURE macro in Fixtures.c must match the name you used in the CREATE_FIXTURE macro in your fixture file.

If you happen to have a fixture that does not have any functions, like for setup and tear down, you can use this macro:

SLIM_CREATE_EMPTY_FIXTURE(name)

************
* Makefile *
************
The only thing left is the makefile.  The makefile provided will build the CSlim library and its unit tests.  It will also build a second executable from everything in /fixtures.  CSlim depends on CppUTest, notice it is using the ComponentMakefile from CppUTest.  You can model your makefiles after these or whatever you want.

To build for windows, uncomment this line in the makefile
# OS_PLATFORM = win

*************************************
* Running the example fitnesse test *
*************************************
You need to download FitNesse from fitnesse.org.  Example pages are in cslim/fixtures/pages.  Fire up fitnesse and create a new page like CslimExample.  Add this to your CslimExample page:

!contents -R2 -g -p -f -h

!define TEST_SYSTEM {slim}
!define TEST_RUNNER {<path>/cslim/Cslim_cslim}
!define COMMAND_PATTERN {%m}

If you are using a unix based system, make a symbolic link in fitnesse/FitNesseRoot/CslimExample pointing to cslim/fixtures/pages, with a command like this:

	ln -s <path>/cslim/fixtures/pages CslimExampleSuite

You should be able to see the CounterTest, DivisionTest, etc.


**************
* Unit Tests *
**************
CSlim was built using CppUTest. You'll have to down load and make CppUTest (http://www.cpputest.org/). Put it next to the cslim directory like this:

<path>/cslim
<path>/CppUTest


******************
* Communications *
******************
CSlim communicates with FitNesse over a stream socket.  A bsd socket implementation of sockets is provided.  You can use CSlim with other socket implementations by re-implementing the modules in src/Com

*******
* C++ *
*******
When using CSlim to test a C++ project, give you fixtures .cpp extensions, but make sure to wrap all the fixture methods in an 'extern "C"'  See Main/FixtureInCpp.cpp for an example of testing a C++ class with CSlim.
