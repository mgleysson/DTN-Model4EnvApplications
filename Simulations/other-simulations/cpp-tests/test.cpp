/* strtok example */
#include <stdio.h>
#include <string.h>
#include <typeinfo>
#include <iostream>
using namespace std;

int main ()
{
  string values ="{10,20,30}";
  char * pch;

  char * toCharValuesList = strdup(values.c_str());
  pch = strtok (toCharValuesList, "{,}");

  pch = strtok (NULL, "{,}");

  string remainingSamples = "{";

  while (pch != NULL)
  {
    remainingSamples = remainingSamples + std::string(pch) + ",";
    pch = strtok (NULL, "{,}");
  }

  remainingSamples[remainingSamples.size()-1] = '}';
  cout << remainingSamples << endl;

  pch = strtok (NULL, "{,}");

  remainingSamples = "{";

  while (pch != NULL)
  {
    remainingSamples = remainingSamples + std::string(pch) + ",";
    pch = strtok (NULL, "{,}");
  }

  remainingSamples[remainingSamples.size()-1] = '}';
  cout << remainingSamples << endl;

  pch = strtok (NULL, "{,}");

  remainingSamples = "{";

  while (pch != NULL)
  {
    remainingSamples = remainingSamples + std::string(pch) + ",";
    pch = strtok (NULL, "{,}");
  }

  remainingSamples[remainingSamples.size()-1] = '}';
  cout << remainingSamples << endl;

  pch = strtok (NULL, "{,}");

  remainingSamples = "{";

  while (pch != NULL)
  {
    remainingSamples = remainingSamples + std::string(pch) + ",";
    pch = strtok (NULL, "{,}");
  }

  remainingSamples[remainingSamples.size()-1] = '}';
  cout << remainingSamples << endl;

  cout << remainingSamples.size() << endl;

  return 0;
}
