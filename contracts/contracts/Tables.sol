// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@tableland/evm/contracts/utils/TablelandDeployments.sol";
import "@tableland/evm/contracts/utils/SQLHelpers.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Starter {
  // The table token ID, assigned upon `TablelandTables` minting a table
  uint256 private constant _tableId = 107;
  // Table prefix for the table (custom value)
  string private constant _TABLE_PREFIX = "dao_conference_votes_11155111_293";

  // Insert data into a table
    function insert() public payable {
        /*  Under the hood, SQL helpers formulates:
        *
        *  INSERT INTO {prefix}_{chainId}_{tableId} (id,val) VALUES(
        *    1
        *    'msg.sender'
        *  );
        */
        TablelandDeployments.get().mutate(
            address(this),
            _tableId,
            SQLHelpers.toInsert(
                _TABLE_PREFIX,
                _tableId,
                "id,city,country,reason",
                string.concat(
                    Strings.toString(5),
                    ",",
                    "Guadalajara,"
                    "mx,",
                    "good",
                )
            )
        );
    }
}