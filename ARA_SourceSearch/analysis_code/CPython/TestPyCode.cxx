#include </usr/include/python3.6m/Python.h>
#define PY_SSIZE_T_CLEAN
#include <stdio.h>
#include <iostream>
using namespace std;

 
int
main(int argc, char** argv)
{
    Py_Initialize();

    // First set in path where to find your custom python module.
    // You have to tell the path otherwise the next line will try to load
    // your module from the path where Python's system modules/packages are
    // found.
    PyObject* sysPath = PySys_GetObject("path");
    PyList_Append(sysPath, PyUnicode_FromString("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/analysis_code/CPython/"));

    // Load the module
    PyObject *pName = PyUnicode_FromString("returnCenA");
    PyObject *pModule = PyImport_Import(pName);
    PyObject *pFunc, *pFuncUnixTime;
    PyObject *pValue, *pUnixTime, *pValue2, *pStation;
    PyObject *pDict, *pArgs;
    // Random use-less check
    std::cout<< "Works fine till here\n";

    if (pModule != NULL) {
        std::cout << "Python module found\n";

        // Load all module level attributes as a dictionary
        pDict = PyModule_GetDict(pModule);

        // Remember that you are loading the module as a dictionary, the lookup you were
        // doing on pDict would fail as you were trying to find something as an attribute
        // which existed as a key in the dictionary
        pFunc = PyDict_GetItem(pDict, PyUnicode_FromString("getCenACoords"));
        // pFuncUnixTime = PyDict_GetItem(pDict, PyUnicode_FromString("returnTime"));

        if(pFunc != NULL){
            cout << "Imported Python function successfully\n";
        } else {
            std::cout << "Couldn't find func\n";
            abort();//Abort if module not found
        }
    }
    else{
      std::cout << "Python Module not found\n";
      abort();//Abort if module not found
    }
    
    pArgs = PyTuple_New(2); 

    for(int unixtime = 1617997947;unixtime<1617997957;unixtime++){
            
      //Implement function now
      pUnixTime = PyLong_FromLong(unixtime);//Arguments, unixtime in this case 
      pStation = PyLong_FromLong(2);//Arguments, unixtime in this case 

      PyTuple_SetItem(pArgs, 0, pStation);
      PyTuple_SetItem(pArgs, 1, pUnixTime);


      // pValue2 = PyObject_CallObject(pFuncUnixTime, pArgs);//call function that returns unixTime 
      // int result2 = PyLong_AsLong(pValue2);
      
      pValue = PyObject_CallObject(pFunc, pArgs);
      double result = PyFloat_AsDouble(pValue);
      printf("Returned val: %0.3f\n", result);
    }

    // Clean up
    Py_DECREF(pModule);
    Py_DECREF(pName);
    Py_DECREF(pFunc);
    Py_DECREF(pDict);
    Py_DECREF(pValue);



    // Finish the Python Interpreter
    Py_Finalize();
    return 0;

}
