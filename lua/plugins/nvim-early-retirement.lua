return {
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
    opts = {
      retirementAgeMins = 8*60,
      minimumBufferNum = 5,
      notificationOnAutoClose = true
    }
  }
}
