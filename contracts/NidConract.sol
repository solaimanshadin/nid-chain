// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.4;
/**
 * @title NID Contract
 * @dev Store & retrieve value in a variable
 */
contract NidContract {

    event AddNidData(address recipient, uint nid);

    struct NidData {
        uint nid;
        address username;
        string nameEng;
        string nameBangla;
        string gender;
        string bloodGroup;
        string birthPlace;
        string birthCertificateNumber;
        string birthDate;
        string fatherName;
        string fatherNid;
        uint fatherYearOfDead;
        string motherName;
        string motherNid;
        uint motherYearOfDeadYear;
        bool maritalStatus;
        string husbandOrWifeName;
        string husbandOrWifeNid;
        uint husbandOrWifeDeadYear;
        string education;
        string occupation;
        bool disability;
        uint tinNumber;
        uint drivingLicenseNumber;
        string religion;
        string mobileNumber;
        string mobileNumber;
        string presetDivision;
        string permanentDivision;
        string presetDistrict;
        string permanentDistrict;
        string presetUpazila;
        string permanentUpazila;
        string presentRmo;
        string permanentRmo;
        string presentCityCorporation;
        string permanentCityCorporation;
        string presentUnion;
        string permanentUnion;
        string presentMahalla;
        string permanentMahalla;
        string presentMahalla;
        string permanentMahalla;
        uint presentUnionWard;
        uint permanentUnionWard;
        string presentVillageOrRoad;
        string permanentVillageOrRoad;
        string presentHoldingNumber;
        string permanentHoldingNumber;
        string presentPostOffice;
        string permanentPostOffice;
        string presentPostalCode;
        string parmatentPostalCode;
        string voterArea;
        string imageUrl;
    }

    NidData[] private nids;

    mapping(uint256 => address) nidToAgent;

    function addNidData(
        string memory nameEng,
        string memory nameBangla,
        string memory gender,
        string memory bloodGroup,
        string memory birthPlace,
        string memory birthCertificateNumber,
        string memory birthDate,
        string memory fatherName,
        string memory fatherNid,
        uint fatherYearOfDead,
        string memory motherName,
        string memory motherNid,
        uint motherYearOfDeadYear,
        bool maritalStatus,
        string memory husbandOrWifeName,
        string memory husbandOrWifeNid,
        uint husbandOrWifeDeadYear,
        string memory education,
        string memory occupation,
        bool disability,
        uint tinNumber,
        uint drivingLicenseNumber,
        string memory religion,
        string memory mobileNumber,
        string memory mobileNumber,
        string memory presetDivision,
        string memory permanentDivision,
        string memory presetDistrict,
        string memory permanentDistrict,
        string memory presetUpazila,
        string memory permanentUpazila,
        string memory presentRmo,
        string memory permanentRmo,
        string memory presentCityCorporation,
        string memory permanentCityCorporation,
        string memory presentUnion,
        string memory permanentUnion,
        string memory presentMahalla,
        string memory permanentMahalla,
        string memory presentMahalla,
        string memory permanentMahalla,
        uint presentUnionWard,
        uint permanentUnionWard,
        string memory presentVillageOrRoad,
        string memory permanentVillageOrRoad,
        string memory presentHoldingNumber,
        string memory permanentHoldingNumber,
        string memory presentPostOffice,
        string memory permanentPostOffice,
        string memory presentPostalCode,
        string memory parmatentPostalCode,
        string memory voterArea,
        string memory imageUrl,
    ) external {
        uint nid = task[nids.length-1].nid + 1 || 1000000000;
        nids.push(NidData(
            nid,
            msg.sender,
            nameEng,
            nameBangla,
            gender,
            bloodGroup,
            birthPlace,
            birthCertificateNumber,
            birthDate,
            fatherName,
            fatherNid,
            fatherYearOfDead,
            motherName,
            motherNid,
            motherYearOfDeadYear,
            maritalStatus,
            husbandOrWifeName,
            husbandOrWifeNid,
            husbandOrWifeDeadYear,
            education,
            occupation,
            disability,
            tinNumber,
            drivingLicenseNumber,
            religion,
            mobileNumber,
            mobileNumber,
            presetDivision,
            permanentDivision,
            presetDistrict,
            permanentDistrict,
            presetUpazila,
            permanentUpazila,
            presentRmo,
            permanentRmo,
            presentCityCorporation,
            permanentCityCorporation,
            presentUnion,
            permanentUnion,
            presentMahalla,
            permanentMahalla,
            presentMahalla,
            permanentMahalla,
            presentUnionWard,
            permanentUnionWard,
            presentVillageOrRoad,
            permanentVillageOrRoad,
            presentHoldingNumber,
            permanentHoldingNumber,
            presentPostOffice,
            permanentPostOffice,
            presentPostalCode,
            parmatentPostalCode,
            voterArea,
            imageUrl,
        ));
        nidToAgent[nid] = msg.sender;
        emit AddNidData(msg.sender, nid);
    }

    function getAgentEntries() external view returns (NidData[] memory) {
        NidData[] memory temporary = new NidData[](nids.length);
        uint counter = 0;
        for(uint i=0; i<nids.length; i++) {
            if(nidToAgent[i] == msg.sender) {
                temporary[counter] = nids[i];
                counter++;
            }
        }

        NidData[] memory result = new NidData[](counter);
        for(uint i=0; i<counter; i++) {
            result[i] = temporary[i];
        }
        return result;
    }

    function getSingleNid(nid) external view returns (NidData memory) {
        return nids[nid];
    }

}