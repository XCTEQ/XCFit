#ifndef CPP_COMPILING
#ifdef __cplusplus
extern "C" {
#endif
#endif

#include "StatementExecutor.h"

#define SLIM_QUOTES(x)  #x
#define SLIM_FIXTURE(fixture) \
extern void fixture##_Register(StatementExecutor*);\
StatementExecutor_AddFixture(executor, fixture##_Register);

#define SLIM_FIXTURES void AddFixtures(StatementExecutor* executor) \
{

#define SLIM_END }

#define PRIVATE_REGISTER_FIXTURE(name) StatementExecutor_RegisterFixture(executor, #name, name##_Create, name##_Destroy);

#define SLIM_CREATE_EMPTY_FIXTURE(name)  \
	void name##_Register(StatementExecutor* executor) \
	{ \
		PRIVATE_REGISTER_FIXTURE(name)\
	}


#define SLIM_CREATE_FIXTURE(name) static const char * fixtureName = #name; \
void name##_Register(StatementExecutor* executor) \
{ \
	PRIVATE_REGISTER_FIXTURE(name);

#define SLIM_FUNCTION(name) StatementExecutor_RegisterMethod(executor, fixtureName, #name, name);


#define SLIM_ABORT(reason) SLIM_QUOTES(__EXCEPTION__:ABORT_SLIM_TEST:message:<<reason.>>)

#define SLIM_EXCEPTION(reason) SLIM_QUOTES(__EXCEPTION__:message:<<reason.>>)

#define SLIM_CONSTRUCTOR_ERROR(errorHandler, reason) 		StatementExecutor_ConstructorError(errorHandler, reason);


#ifndef CPP_COMPILING
#ifdef __cplusplus
}
#endif
#endif
