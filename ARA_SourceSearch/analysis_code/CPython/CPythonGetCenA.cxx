#include </usr/include/python3.6m/Python.h>
#define PY_SSIZE_T_CLEAN
#include <stdio.h>
#include <iostream>
using namespace std;

int
main(int argc, char** argv)
{
  Py_Initialize();
  PyObject * mainModule = PyImport_AddModule("__main__");
  PyObject * hashlibModule = PyImport_ImportModule("hashlib");
  PyModule_AddObject(mainModule, "hashlib", hashlibModule);
  PyObject * subModules = PyList_New(0);
  PyList_Append(subModules, PyUnicode_FromString("md5"));
  PyList_Append(subModules, PyUnicode_FromString("sha1"));
  PyObject * hashlibImports = PyImport_ImportModuleEx("hashlib", NULL, NULL, subModules);
  PyObject * md5Module = PyObject_GetAttr(hashlibImports, PyUnicode_FromString("md5"));
  PyObject * sha1Module = PyObject_GetAttr(hashlibImports, PyUnicode_FromString("sha1"));
  PyModule_AddObject(mainModule, "md5", md5Module);
  PyModule_AddObject(mainModule, "sha1", sha1Module);
  Py_Finalize();
  return 0;

}
