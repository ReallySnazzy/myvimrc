local snip = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

function mk_snippet(name, text, args)
  if args == nil then
    args = {}
  end
  return snip.snippet(name, fmt(text, args))
end

return {
  add_snippets = function()
    snip.add_snippets("json", {


      mk_snippet("schema_example", [==[
{{
  "$id": "https://example.com/arrays.schema.json",
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "description": "Arrays of strings and objects",
  "title": "Arrays",
  "type": "object",
  "properties": {{
    "fruits": {{
      "type": "array",
      "items": {{
        "type": "string"
      }}
    }},
    "vegetables": {{
      "type": "array",
      "items": {{ "$ref": "#/$defs/veggie" }}
    }}
  }},
  "$defs": {{
    "veggie": {{
      "type": "object",
      "required": [ "veggieName", "veggieLike" ],
      "properties": {{
        "veggieName": {{
          "type": "string",
          "description": "The name of the vegetable."
        }},
        "veggieLike": {{
          "type": "boolean",
          "description": "Do I like this vegetable?"
        }}
      }}
    }}
  }}
}}
      ]==])


    })

    snip.add_snippets("nix", {


      mk_snippet("derivation_project", [==[
let
  pkgs = (import <nixpkgs> {{}});
in pkgs.stdenv.mkDerivation {{
  name = "derivation";
  src = yeet;
  buildInputs = [
    pkgs.rust
  ];
  buildPhase = ''
    mkdir $out
  '';
  installPhase = ''
    cp x $out/x
  '';
  builder = "test.sh";
}}
      ]==]),


      mk_snippet("derivation_git", [==[
pkgs.stdenv.mkDerivation {{
  name = "git-puller";
  src = builtins.fetchGit {{
    url = "git@github.com:ReallySnazzy/adventureland.git";
    rev = "hash";
    allRefs = true;
  }};
  __noChroot = true;
  buildInputs = [
    pkgs.git
    pkgs.openssh
  ];
  buildPhase = ''
    cp -rv . $out
  '';
}}
      ]==]),


      mk_snippet("derivation_file", [==[
pkgs.writeText "{1}" ''
  {2}
''
      ]==], {
        snip.insert_node(1),
        snip.insert_node(2)
      }),


      mk_snippet("derivation_script", [==[
pkgs.writeScript "{1}" ''
  {2}
''
      ]==], {
        snip.insert_node(1),
        snip.insert_node(2)
      }),


    })
  end
}
