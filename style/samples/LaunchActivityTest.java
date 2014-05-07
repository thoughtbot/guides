public class LaunchActivityTest
        extends ActivityUnitTestCase<LaunchActivity> {

    @Override
    protected void setUp() throws Exception {
        super.setUp();
        mLaunchIntent = new Intent(getInstrumentation()
                .getTargetContext(), LaunchActivity.class);
        startActivity(mLaunchIntent, null, null);
        final Button launchNextButton =
                (Button) getActivity()
                        .findViewById(R.id.launch_next_activity_button);
    }
	
	
	public void testNextActivityWasLaunchedWithIntent() {
	    startActivity(mLaunchIntent, null, null);
	    final Button launchNextButton =
	            (Button) getActivity()
	            .findViewById(R.id.launch_next_activity_button);
	    launchNextButton.performClick();

	    final Intent launchIntent = getStartedActivityIntent();
	    assertNotNull("Intent was null", launchIntent);
	    assertTrue(isFinishCalled());

	    final String payload =
	            launchIntent.getStringExtra(NextActivity.EXTRAS_PAYLOAD_KEY);
	    assertEquals("Payload is empty", LaunchActivity.STRING_PAYLOAD, payload);
	}
}