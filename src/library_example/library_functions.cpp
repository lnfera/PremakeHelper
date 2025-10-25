#include "pch_library_example.hpp"
#include "library_functions.h"

void Library::FooBar()
{
	for (int i = 0; i < 100; i++)
	{
		const char* msg = i % 2 == 0 ? "Foo " : "Bar ";

		std::cout << msg;
	}

}
