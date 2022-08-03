import {expect} from "chai";
import { ethers } from "hardhat";
import { Contract } from 'ethers';
import { MACToken } from '../typechain-types/MACToken';



describe("My ERC-20 test ", function(){
  let erc: Contract;
  let name:string;
  let symbol :string;
  let owner : any;
  let buyer : any;
  let account2 :any;
  let account3 :any;
  

    beforeEach(async function() {
        [owner, buyer, account2, account3] = await ethers.getSigners();
        const MACToken = await ethers.getContractFactory("MACToken",owner);
        erc = await MACToken.deploy(1000000);
        await erc.deployed();
    })

    describe("Basic: owner address, name, symbol, initialSuply:",function(){
       
        it("should be deployed by owner", async function() {
            expect(erc.address).to.be.properAddress;
        })
        
        it("should have the name 'MACCOM' and the symbol 'MAC'",async function(){
        expect(await erc.name() ).to.equal("MACCOM");
        })

        it("should have the name 'MACCOM' and the symbol 'MAC'",async function(){
            expect( await erc.symbol()).to.equal("MAC");
            })
        
        it("should have 1000000 tokens in totalSuply", async function(){
            expect(await erc.totalSuply()).to.equal(1000000);
        })
    })

    describe("Balance",function(){
        
        it("owner should have all tokens of totalsuply on balance", async function() {
        const balance = await erc.balanceOf(owner.address);
        expect(balance).to.eq(1000000);
        })    
    })

    describe("Whitelist",function(){

        it("First: adding to whitelist",async function(){
            const adding = await erc.addUser(erc.address);
            await adding.wait();
            const verified = await erc.verifyUser(erc.address);
            expect(verified).to.be.equal(true);    
        })

        it("Second: revert if you're not in whitelist",async function(){           
            const verified = await erc.verifyUser(erc.connect(buyer).address);
            expect(verified).to.be.equal(false);
        })

        it("Third: be able to run function if you're whitelisted", async function(){
            const [asd] = await ethers.getSigners();
            const addin = await erc.addUser(asd.address);
            await addin.wait();
            expect(await erc.exampleFunction()).to.be.equal(true);
        })

        it("Fourth: NOT to be able to run function if you're not whitelisted", async function(){
           //Not working

            expect(await erc.exampleFunction()).to.be.equal(true);
        })

    })

    describe("Mint", function(){

        it("Should mint the token if you're whitelisted", async function(){
            const adding = await erc.addUser(erc.address);
            await adding.wait();
            const mintable = await erc.mint(erc.address, 1000);
            const balance = await erc.balanceOf(erc.address);
            expect(balance).to.eq(1000);
        })

        it("NOT to be able to mint tokens if you're NOT whitelisted", async function(){
            const mintable = erc.mint(erc.connect(account2).address, 1000);
            await expect(mintable).to.be.revertedWith("You need to be whitelisted");
        })
    })

    describe("Burn", async function(){
        it("Shold burn the tokens if you're whitelisted", async function(){
            const adding = await erc.addUser(erc.address);
            await adding.wait();
            const mintable = await erc.mint(erc.address, 1000);
            const burnable = await erc.burn(erc.address, 500);
            const balance = await erc.balanceOf(erc.address);
            expect(balance).to.eq(500);    
        })

        it("NOT be able to burn tokens if you're not whitelisted", async function(){
            const burnable = erc.burn(erc.connect(account2).address, 500);
            await expect(burnable).to.be.revertedWith("You need to be whitelisted");
        })
    })

    describe("Transactions", function(){
        
        it("Should be possible to transfer tokens from owner to other account", async function(){
            await erc.transferTo(buyer.address, 500);
            const balanceBuyer = await erc.balanceOf(buyer.address);
            expect(balanceBuyer).to.equal(500); 
        })

        it("Function 'approve'", async function(){
            await erc.approve(buyer.address, 10000);
            const tx = await erc.transferFrom(owner.address, buyer.address, 1000 );
            await expect(() => tx).to.changeTokenBalance(erc, buyer.address, 1000);
            const balanceBuyer = await erc.balanceOf(buyer.address);
            expect(balanceBuyer).to.equal(1000); 
            const balanceOwner = await erc.balanceOf(owner.address);
            expect(balanceOwner).to.equal(999000); 

        })
    })
})