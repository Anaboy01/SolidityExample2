// SPDX-License-Identifier: MIT
 pragma solidity ^0.8.24;

 contract BaseStore {
  uint256 public rice = 500;
   uint256 public  water = 300;
    uint256 public  burger = 100;
    uint256 public  shawarma = 400;

    function Allprices() public view virtual returns(uint256 _riceP,  uint256 _waterP, uint256 _burgerP , uint256 _shawarmaP  ){
        return (rice, water, burger, shawarma);
    }
 }

 contract Ikorodustore is  BaseStore {
    function getBasePrice() public view returns  (uint256 _riceP,  uint256 _waterP, uint256 _burgerP , uint256 _shawarmaP){
        return super.Allprices();
    }
      function Allprices() public view  virtual override returns(uint256 _riceP,  uint256 _waterP, uint256 _burgerP , uint256 _shawarmaP  ) {
       return  (
        rice * 10,
        water * 10,
        burger * 10,
        shawarma * 10
       );
    }
 }

 contract MainlandStore is  BaseStore, Ikorodustore {
    function IkoroduPrice() public view returns (uint256 _riceP,  uint256 _waterP, uint256 _burgerP , uint256 _shawarmaP){
        return super.Allprices();
    }
       function Allprices() public view  virtual override(BaseStore, Ikorodustore) returns(uint256 _riceP,  uint256 _waterP, uint256 _burgerP , uint256 _shawarmaP  ) {
       return  (
        rice * 15,
        water * 15,
        burger * 15,
        shawarma * 15
       );
    }
 }

 contract Vi is BaseStore, Ikorodustore, MainlandStore {

       function IslandPrice() public view returns (uint256 _riceP,  uint256 _waterP, uint256 _burgerP , uint256 _shawarmaP){
        return super.Allprices();
    }
    function Allprices() public view virtual override( BaseStore, Ikorodustore, MainlandStore ) returns(uint256 _riceP,  uint256 _waterP, uint256 _burgerP , uint256 _shawarmaP ) {
  
            return (
            rice * 25,
            water * 25,
            burger * 25,
            shawarma * 25
        );
    }
}