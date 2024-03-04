#include "AssimpWrapper.h"
#include <assimp/Importer.hpp>
#include <assimp/scene.h>
#include <assimp/postprocess.h>
#include <assimp/Exporter.hpp>

void convertSTLtoOBJ(const char *inputPath, const char *outputPath) {
  printf("inputPath %s\n", inputPath);
  Assimp::Importer importer;
  const aiScene* scene = importer.ReadFile(inputPath, aiProcess_Triangulate);

  if (!scene) {
      printf("ERROR: Read file failed: %s\n", importer.GetErrorString());
      return;
  }

  Assimp::Exporter exporter;
  aiReturn res = exporter.Export(scene, "obj", outputPath);

  if (res != aiReturn_SUCCESS) {
      printf("ERROR: Export failed.\n");
  }


}
