import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Array "mo:base/Array";
import Random "mo:base/Random";
import Debug "mo:base/Debug";

actor {
    public func love_injection() : async () {
        let words = ["ドド", "スコ"];
        let seachPhrase = Array.foldLeft(Array.tabulate<Text>(1, func _ { "ドドスコスコスコ" }), "", Text.concat);
        let endPhrase = "ラブ注入♡";

        var genPhrase = "";
        var rf = Random.Finite(await Random.blob());
        while (Text.endsWith(genPhrase, #text(seachPhrase)) == false) {
            let ?rand = rf.range(1);
            genPhrase := genPhrase # words[rand];
            if (Text.size(genPhrase) > Text.size(seachPhrase)) {
                genPhrase := "";
                rf := Random.Finite(await Random.blob());
            };
            Debug.print(genPhrase);
        };
        Debug.print(endPhrase);
    };
};