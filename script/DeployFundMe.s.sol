//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {Script, VmSafe} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}

// https://docs.chain.link/data-feeds/price-feeds/addresses - ETH USD chainlink price feed - 0x694AA1769357215DE4FAC081bf1f309aDC325306