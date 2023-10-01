describe("Transfers", function () {
    it("Should transfer the funds to the owner", async function () {
      const { lock, unlockTime, lockedAmount, owner } = await loadFixture(
        deployOneYearLockFixture
      );

      await time.increaseTo(unlockTime);

      await expect(lock.withdraw()).to.changeEtherBalances(
        [owner, lock],
        [lockedAmount, -lockedAmount]
      );
    });
  });