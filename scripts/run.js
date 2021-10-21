const main = async () => {
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const waveContractFactory = await hre.ethers.getContractFactory('WavePortal');
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed();
  
    console.log("Contract deployed to:", waveContract.address);
    console.log("Contract deployed by:", owner.address);
  
    let waveCount;
    waveCount = await waveContract.getTotalWaveCount();
    
    // Simulate us (owner) hitting the wave contract .wave() function
    let waveTxn = await waveContract.wave();
    waveTxn = await waveContract.unWave();
    await waveTxn.wait();

    // Simulate some wallet owner (randomPerson) hitting the contract .wave() function
    waveTxn = await waveContract.connect(randomPerson).wave();

    await waveTxn.wait();
  
    waveCount = await waveContract.getTotalWaveCount();
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();