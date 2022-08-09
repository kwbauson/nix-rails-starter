{
  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system: {
    devShells.default = with nixpkgs.legacyPackages.${system}; mkShell {
      buildInputs = let ruby = ruby_3_1; in
        [
          (ruby.withPackages (ps: [ ps.rails ]))
          sqlite
        ];
    };
  });
}
