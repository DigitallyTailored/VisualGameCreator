xof 0302txt 0032
// This model was made with Cartography Shop
// http://www.leadwerks.com
Header 
  {
  1;
  0;
  1;
  }
Material material_1
  {
  1.0;1.0;1.0;1.0;;
  11.3137;
  0.0;0.0;0.0;;
  0.012549;0.0360784;0.0109804;;
  TextureFilename
    {
    "darktree.png";
    }
  }
Frame World
  {
  FrameTransformMatrix
    {
    1.0,0.0,0.0,0.0,
    0.0,1.0,0.0,0.0,
    0.0,0.0,1.0,0.0,
    0.0,0.0,0.0,1.0;;
    }
  Mesh object1
    {
    4;
    -192.000000;0.000000;0.000000;,
    192.000000;0.000000;0.000000;,
    192.000000;384.000000;0.000000;,
    -192.000000;384.000000;0.000000;;
    2;
    3;0,2,1;,
    3;2,0,3;;
    MeshTextureCoords
      {
      4;
      0.000000;0.000000;,
      -1.000000;0.000000;,
      -1.000000;-1.000000;,
      0.000000;-1.000000;;
      }
    MeshMaterialList
      {
      1;
      2;
      0,
      0;;
      { material_1 }
      }
    }
  }
