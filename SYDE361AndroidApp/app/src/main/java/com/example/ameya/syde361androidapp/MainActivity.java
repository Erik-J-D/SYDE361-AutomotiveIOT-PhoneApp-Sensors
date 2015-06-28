package com.example.ameya.syde361androidapp;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Set;


public class MainActivity extends Activity {
    Set<BluetoothDevice> devicesArray;
    BluetoothAdapter mBluetoothAdapter;
    ArrayList bondedDevicesList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (!mBluetoothAdapter.isEnabled()) {
            Intent startBluetooth = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            startActivity(startBluetooth);
        }
        
        getBondedDevices();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onResume(){
        super.onResume();

        bondedDevicesList = new ArrayList();
    }

    public void getBondedDevices(){
        devicesArray = mBluetoothAdapter.getBondedDevices();
        if (!devicesArray.isEmpty()) {
            for (BluetoothDevice device: devicesArray){
                bondedDevicesList.add("Name: "+device.getName() + " Address: " + device.getAddress());
            }
        }
        else {
            Toast.makeText(getApplicationContext(), "No paired devices!", Toast.LENGTH_SHORT).show();
        }
    }


}
