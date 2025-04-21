# Steps to Configure Capacity Alerts - Overview

Costa Rica

[![GitHub](https://badgen.net/badge/icon/github?icon=github&label)](https://github.com)
[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-21

----------

> - **Monitoring**: Regularly monitor your capacity usage to ensure the alerts are functioning as expected. <br/>
> - **Adjustments**: You can adjust the threshold and recipients at any time based on your needs.

  | **Notification Setting** | **Value** |
  |--------------------------|-----------|
  | **Threshold**            | 80%       |
  | **Recipients**           | Capacity admins, Specific contacts |

1. Go to the [Microsoft Fabric service](https://app.fabric.microsoft.com/) and sign in with your admin credentials.
2. **Access the Admin Portal**:
   - Click on the `Settings` gear icon in the top right corner.
   - Select `Admin Portal` from the dropdown menu.

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/65b61468-c046-469b-a98b-d8a93cd333b5">

3. **Navigate to Capacity Settings**:
   - In the Admin Portal, go to the `Capacity settings` section.
   - Select the capacity you want to configure notifications for.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/010dfd67-b88f-4c29-b8cd-f1dc6b7ebe75">

4. **Configure Notifications**:
   - Expand the `Notifications` section.
   - In the `Send notifications when` field, set the threshold to `80%`. This will trigger an alert when your capacity usage reaches 80% of the available CUs.
   - You can also configure additional notifications for other thresholds if needed.
5. **Specify Recipients**:
   - In the **Send notifications to** field, select who should receive the notifications:
     - **Capacity admins**: Email notifications will be sent to all admins of this capacity.
     - **These contacts**: Enter the email addresses of specific contacts who should receive the notifications.
6. **Apply Changes**: Click `Apply` to save the notification settings.

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/962e9391-8510-4c15-acdb-5e53991c5a40">

> Find below an example of the email format:

<img width="700" alt="image" src="https://github.com/user-attachments/assets/308e372d-48de-46f4-9138-984e15b5fd24">

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
