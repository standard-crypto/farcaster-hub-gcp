# This file is maintained automatically by "terraform init".
# Manual edits may be lost in future updates.

provider "registry.terraform.io/grafana/grafana" {
  version     = "2.3.3"
  constraints = "~> 2.3"
  hashes = [
    "h1:y+nYORJVgnE7wuPpmh8vxQ1fOjlu1ylBEanVG83eJRU=",
    "zh:07c3ebddd655bbe0fe215eb20919f84856b2ef4ddb575cd1c4005814aa55d3c9",
    "zh:1b5f526338ac7b288c3c88fcb525c2b8fc087a944a0a178a6d0ee3b6f46cb026",
    "zh:271dbd8d52e0ed7571625d204e0adcdcdb22af9ead6503a49b4cbcea4de1be6b",
    "zh:3fd7ea40960756ad4c8da03042638a03ddf42bc5d91f244ecf4c2b6eb9127273",
    "zh:4504708b357034205832d6ba9a8fc89bad5721f519677d622d67f333728a2434",
    "zh:4c4aeb35cd93b472933b97ef1d981f5ba4b50ffcfc5dbdc2a0c725db66f119b3",
    "zh:4ed7dc18448eb35463033da9a7da35c519f0579bfddab7a40f01fd48fb9df456",
    "zh:50d8583d4e423c63ce7ee153e18b75e1b774e539de96afe3293b7bb1b897a23b",
    "zh:7cdd7edcca816d439eb61b399c7f7f6e9d4ecb5db1c8147ff52b262c36e35c3c",
    "zh:839ddb8fdccf6b3e6c64bb2b7b571335df0c47ecebddd6687d3c2ae63e45741a",
    "zh:b67b5f1976af251bf18d7343e4736017734070f84ea7bc68e606b4d71a54a957",
    "zh:bb773a82de1a257bfe474780025e5b80881d4a13a5c3ccea5cb9720b609c4bcd",
    "zh:dca914c83942eda4a7a9fe6b01ee4690fa901bdfa3a8210d21b9cff29126f989",
    "zh:f0cf25c6e35580f54bc124ca99dc5f0d19f5612f443933760635f3e309cc59b3",
  ]
}

provider "registry.terraform.io/hashicorp/google" {
  version     = "4.83.0"
  constraints = ">= 3.33.0, >= 3.45.0, >= 3.83.0, ~> 4.0, >= 4.25.0, >= 4.51.0, != 4.65.0, != 4.65.1, < 5.0.0"
  hashes = [
    "h1:BOrMAGh1FwA290rqwOHJKdfYOhOyqcKiqunZ6K/qA6k=",
    "zh:0310360982c3d42449ef103fab0819770aa96c7813507778d71ed016942bed96",
    "zh:0d0f82ce5e54267641b1f1d494a3ad1ddd41a7553910dd33abd6a114feab6881",
    "zh:0eda79e53a1833e8692273f5d7224344200e49303e579aec7b53762f50f39210",
    "zh:3c0cf4abaf461238563132ab4564965bc6bd571eb3bbeedac89258a9a688b169",
    "zh:61d619e5163daeeb7909443cc0c67816939a1748aec2fe544ab3f380270aae92",
    "zh:66d9da66aec8575ee16b70b42a5ae082b2f43f4a84a844363a585806ac75cca0",
    "zh:875c5596f365130095ccc2150755b6fb8a6d9fe9af4af9f595029716be02cdef",
    "zh:a9af92cd6ea160618d6433c92297a4e3f3dc7a2e964516e1e7b51ce70f3ec178",
    "zh:b9566bd1910462b4d92c6976184c4408e42a3ef6a300962b49866aa0f6f29b11",
    "zh:bae735a81a04244893fd9e81d9b5d6c321d874cb37a7b5aab8a1c8c5044b362d",
    "zh:d97ae1676d793696498e0eda8324bc02edbd2fbbcd76eb103a949876ec1fe8c0",
    "zh:f569b65999264a9416862bca5cd2a6177d94ccb0424f3a4ef424428912b9cb3c",
  ]
}

provider "registry.terraform.io/hashicorp/google-beta" {
  version     = "4.83.0"
  constraints = ">= 3.45.0, < 5.0.0"
  hashes = [
    "h1:uKmM3fJQyowwBV5qlAl4+qteXbsCEkwmGAwxaci+9cw=",
    "zh:006d2f02999598109ab0c6737495904e83bb78008defc7590d18d4a997dc7cbf",
    "zh:04455b025c1a5551187495125dd045d3c11334dcb68cc0c62d82574513f42eab",
    "zh:0b20f658e322c561bc6364240bc4169971e00efbbba8781b38c18dcf014e0788",
    "zh:2262b2ceb759427a0ec7fe994dd07fd1ee7c3cae2b1d87ef55aa7f005ffb6c52",
    "zh:3cf502334354b75334ff5b4285b2afcbef11b91c7cf1e18e16c2b1bb5a77e099",
    "zh:9469a3356b543894273beb2332cbf8f230cdbe810d5e3d18de3a461a726a20b2",
    "zh:968914382e310d0b41c012ec6435d796c40f5b95239f68ed8aad24be4dc705d6",
    "zh:aa70ee3f4dd1f433b965049f58c93c47e2f7f31cfd7848ec88afad71d14f7038",
    "zh:d2aa8fceb732886c2c80ff17237a6184fb3e7806e0280d4a1ab0e3d4a83b8fa9",
    "zh:e470be740b1854a157c1ff5d4f12a13548842135f0fddc1eda29571dc7c65327",
    "zh:e51e894c0bc9d9982de9ae42c1434c5397f77db41bb7e095996a715315018874",
    "zh:f569b65999264a9416862bca5cd2a6177d94ccb0424f3a4ef424428912b9cb3c",
  ]
}

provider "registry.terraform.io/hashicorp/kubernetes" {
  version     = "2.23.0"
  constraints = "~> 2.0, ~> 2.10"
  hashes = [
    "h1:arTzD0XG/DswGCAx9JEttkSKe9RyyFW9W7UWcXF13dU=",
    "zh:10488a12525ed674359585f83e3ee5e74818b5c98e033798351678b21b2f7d89",
    "zh:1102ba5ca1a595f880e67102bbf999cc8b60203272a078a5b1e896d173f3f34b",
    "zh:1347cf958ed3f3f80b3c7b3e23ddda3d6c6573a81847a8ee92b7df231c238bf6",
    "zh:2cb18e9f5156bc1b1ee6bc580a709f7c2737d142722948f4a6c3c8efe757fa8d",
    "zh:5506aa6f28dcca2a265ccf8e34478b5ec2cb43b867fe6d93b0158f01590fdadd",
    "zh:6217a20686b631b1dcb448ee4bc795747ebc61b56fbe97a1ad51f375ebb0d996",
    "zh:8accf916c00579c22806cb771e8909b349ffb7eb29d9c5468d0a3f3166c7a84a",
    "zh:9379b0b54a0fa030b19c7b9356708ec8489e194c3b5e978df2d31368563308e5",
    "zh:aa99c580890691036c2931841e88e7ee80d59ae52289c8c2c28ea0ac23e31520",
    "zh:c57376d169875990ac68664d227fb69cd0037b92d0eba6921d757c3fd1879080",
    "zh:e6068e3f94f6943b5586557b73f109debe19d1a75ca9273a681d22d1ce066579",
    "zh:f569b65999264a9416862bca5cd2a6177d94ccb0424f3a4ef424428912b9cb3c",
  ]
}

provider "registry.terraform.io/hashicorp/random" {
  version     = "3.5.1"
  constraints = ">= 2.1.0"
  hashes = [
    "h1:IL9mSatmwov+e0+++YX2V6uel+dV6bn+fC/cnGDK3Ck=",
    "zh:04e3fbd610cb52c1017d282531364b9c53ef72b6bc533acb2a90671957324a64",
    "zh:119197103301ebaf7efb91df8f0b6e0dd31e6ff943d231af35ee1831c599188d",
    "zh:4d2b219d09abf3b1bb4df93d399ed156cadd61f44ad3baf5cf2954df2fba0831",
    "zh:6130bdde527587bbe2dcaa7150363e96dbc5250ea20154176d82bc69df5d4ce3",
    "zh:6cc326cd4000f724d3086ee05587e7710f032f94fc9af35e96a386a1c6f2214f",
    "zh:78d5eefdd9e494defcb3c68d282b8f96630502cac21d1ea161f53cfe9bb483b3",
    "zh:b6d88e1d28cf2dfa24e9fdcc3efc77adcdc1c3c3b5c7ce503a423efbdd6de57b",
    "zh:ba74c592622ecbcef9dc2a4d81ed321c4e44cddf7da799faa324da9bf52a22b2",
    "zh:c7c5cde98fe4ef1143bd1b3ec5dc04baf0d4cc3ca2c5c7d40d17c0e9b2076865",
    "zh:dac4bad52c940cd0dfc27893507c1e92393846b024c5a9db159a93c534a3da03",
    "zh:de8febe2a2acd9ac454b844a4106ed295ae9520ef54dc8ed2faf29f12716b602",
    "zh:eab0d0495e7e711cca367f7d4df6e322e6c562fc52151ec931176115b83ed014",
  ]
}

provider "registry.terraform.io/integrations/github" {
  version     = "5.38.0"
  constraints = "~> 5.0"
  hashes = [
    "h1:iMYB7YcbElLJXVmmHqNhB5BuwRytcsggSpzIS1Qdz00=",
    "zh:05ec90a2a305c737b27ee8e24f495704eddc13e7bf193e19dc24aa2cf3faabf0",
    "zh:2f24962e8108e9945c3dee9fd1464adcee7ea04469b05f308bf78f8fdab2dc3e",
    "zh:370f98360a8d54ceef2c34fbd4d8ebb4ba75c8aa1bf30d3fb0f55636d8404987",
    "zh:4669ba49c0f95be4fea862ec16fd512b8a0215ea00d183f6cf323c8badfb6830",
    "zh:4ac2b3b75f9d425b799bbbe1346f973271b36d17abb7f8667691b30500e81134",
    "zh:567035c9ae5509c0114fa8d8cac57c9def8b4ebf1def9e8b161ebe45e16d7c90",
    "zh:585970da1d122f90052ebfcbf565193c76c12bd0c61825079672f8c8cdee68dd",
    "zh:a1fe1bf2f3825fb7f2cf9fefdeaaeb5ce8398fcaa8b5b2fd22fae7f34dcddacb",
    "zh:b2aca4d967f18ab59bddc5591de7d8ca076031c304ea3390a26b27088e221822",
    "zh:baef060e6f30c513b49a30b9510b3dfe24b538b1618342e2b4fa37b6e3a1c4c2",
    "zh:c30021d925ea79e9f4beba852058dba7a45d30c92691af2dbf3595113bb539d1",
    "zh:c9dfa0b61e46833bd5ca89fd842f6649b725191c2452c87b21ce501fc3e22b37",
    "zh:d4570bc21127387ec7c8b8f4d57c83115d15a8dbb7837f0d0c434c10e8e90de8",
    "zh:e5060febd3a5afae3374640f8c3394c9cff421bee43efa0acd40795cb0ea87c2",
  ]
}
